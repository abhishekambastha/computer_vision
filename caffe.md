## Using the AMI image

We have built an AMI containing Caffe, Python, Cuda 7, CuDNN, and all dependencies.  Its id is [ami-763a311e](https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#LaunchInstanceWizard:ami=ami-763a311e) (disk min 8G, system is 4.6G); it is designed to work with g2.2xlarge and g2.8xlarge instances.

Precompiled Caffe binaries are placed in ```/home/ubuntu/caffe```. 

Please note that the size of the ```/``` drive is rather small (8G), there is another 60GB mounted in ```/mnt``` where you should place the files you are working with. But also keep in mind that ```/mnt```will be wiped when you shut down the machine.

## Building the AMI image yourself

Below is the script which was used to create it, based on this [Ubuntu 14.04 AMI](http://thecloudmarket.com/image/ami-d05e75b8--ubuntu-images-hvm-ssd-ubuntu-trusty-14-04-amd64-server-20150325) (which, as of this writing, is the default ubuntu HVM image).  The script should be somewhat robust to updates to Ubuntu.  The script will install Caffe wherever it is run; for the AMI, I ran it in the home directory for the `ubuntu` user.

If you want to use CuDNN, you'll also need a copy of cudnn-6.5-linux-x64-v2.tgz.  Place it in the same directory where the script is.

If you want to use this script for installing Caffe on other ubuntu 14.04 machines, ou will probably want to get rid of the lines that set TMPDIR to /mnt.

Note also that AMI creation will involve an additional cleanup step to get rid of keys, etc; this script alone is NOT sufficient for creating a secure release.

	# Add Nvidia's cuda repository
	if [ ! -f "cudnn-6.5-linux-x64-v2.tgz" ] ; then
	  exit 1;
	fi
	wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.0-28_amd64.deb
	sudo dpkg -i cuda-repo-ubuntu1404_7.0-28_amd64.deb

	sudo apt-get update
	# Note that we do upgrade and not dist-upgrade so that we don't install
	# new kernels; this script will install the nvidia driver in the *currently
	# running* kernel.
	sudo apt-get upgrade -y
	sudo apt-get install -y opencl-headers build-essential protobuf-compiler \
	    libprotoc-dev libboost-all-dev libleveldb-dev hdf5-tools libhdf5-serial-dev \
	    libopencv-core-dev  libopencv-highgui-dev libsnappy-dev libsnappy1 \
	    libatlas-base-dev cmake libstdc++6-4.8-dbg libgoogle-glog0 libgoogle-glog-dev \
	    libgflags-dev liblmdb-dev git python-pip gfortran
	sudo apt-get clean

	# Nvidia's driver depends on the drm module, but that's not included in the default
	# 'virtual' ubuntu that's on the cloud (as it usually has no graphics).  It's 
	# available in the linux-image-extra-virtual package (and linux-image-generic supposedly),
	# but just installing those directly will install the drm module for the NEWEST available
	# kernel, not the one we're currently running.  Hence, we need to specify the version
	# manually.  This command will probably need to be re-run every time you upgrade the
	# kernel and reboot.
	#sudo apt-get install -y linux-headers-virtual linux-source linux-image-extra-virtual
	sudo apt-get install -y linux-image-extra-`uname -r` linux-headers-`uname -r` linux-image-`uname -r`

	sudo apt-get install -y cuda
	sudo apt-get clean

	# Optionally, download your own cudnn; requires registration.  
	if [ -f "cudnn-6.5-linux-x64-v2.tgz" ] ; then
	  tar -xvf cudnn-6.5-linux-x64-v2.tgz
	  sudo cp -P cudnn*/libcudnn* /usr/local/cuda/lib64
	  sudo cp cudnn*/cudnn.h /usr/local/cuda/include
	fi
	# Need to put cuda on the linker path.  This may not be the best way, but it works.
	sudo sh -c "sudo echo '/usr/local/cuda/lib64' > /etc/ld.so.conf.d/cuda_hack.conf"
	sudo ldconfig /usr/local/cuda/lib64


	# Get caffe, and install python requirements
	git clone https://github.com/BVLC/caffe.git
	cd caffe
	cd python
	for req in $(cat requirements.txt); do sudo pip install $req; done

	# Prepare Makefile.config so that it can build on aws
	cd ../
	cp Makefile.config.example Makefile.config
	if [ -f "../cudnn-6.5-linux-x64-v2.tgz" ] ; then
	  sed -i '/^# USE_CUDNN := 1/s/^# //' Makefile.config
	fi
	sed -i '/^# WITH_PYTHON_LAYER := 1/s/^# //' Makefile.config
	sed -i '/^PYTHON_INCLUDE/a    /usr/local/lib/python2.7/dist-packages/numpy/core/include/ \\' Makefile.config

	# Caffe takes quite a bit of disk space to build, and we don't have very much on /.
	# Hence, we set the TMPDIR for to /mnt/build_tmp, under the assumption that our AMI has
	# already mounted an ephemeral disk on /mnt.  Note that /mnt gets deleted on reboot, so we
	# need an init script.
	echo 'export TMPDIR=/mnt/build_tmp' >> Makefile.config
	sudo bash -c 'cat <<EOF > /etc/init.d/create_build_dir
	#!/bin/bash
	if [ -d /mnt ] && [ ! -e /mnt/build_tmp ] ; then
	  mkdir /mnt/build_tmp
	  chown ubuntu /mnt/build_tmp
	fi
	EOF'
	sudo chmod 744 /etc/init.d/create_build_dir
	sudo /etc/init.d/create_build_dir
	sudo update-rc.d create_build_dir defaults

	# And finally build!
	make -j 8 all py

	make -j 8 test
	make runtest

	# Do some cleanup
	cd ../
	mkdir installation_files
	mv cudnn* installation_files/
	mv cuda-repo* installation_files/

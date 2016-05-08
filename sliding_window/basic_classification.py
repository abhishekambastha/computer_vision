import numpy as np
caffe_root = '../'
import sys
sys.path.insert(0, caffe_root + 'python')
import caffe
import os
if not os.path.isfile(caffe_root + 'models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel'):
    print('Please Download the model file')

caffe.set_device(0)
caffe.set_mode_gpu()

net = caffe.Net(caffe_root + 'models/bvlc_reference_caffenet/deploy.prototxt', \
                caffe_root + 'models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel', \
                caffe.TEST)

transformer = caffe.io.Transformer({'data': net.blobs['data'].data.shape})
transformer.set_transpose('data', (2,0,1))
transformer.set_mean('data', np.load(caffe_root _ 'python/caffe/imagenet/ilsvrc_2012_mean.npy').mean(1).mean(1))
transformer.set_raw_scale('data', 255)
transformer.set_channel_swap('data', (2,1,0))

net.blobs['data'].reshape(50,3,227,227)

net.blobs['data'].data[...] = transformer.preprocess('data', caffe.io.load_image(caffe_root + 'examples/images/cat.jpg'))
out = net.forward()
print('Predicted class is #{}'.format(out['prob'][0].argmax()))

# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.4

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.4.0/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.4.0/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/aambasth/personalProjects/CVcpp/load

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/aambasth/personalProjects/CVcpp/load

# Include any dependencies generated for this target.
include CMakeFiles/LoadImage.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/LoadImage.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/LoadImage.dir/flags.make

CMakeFiles/LoadImage.dir/load.cpp.o: CMakeFiles/LoadImage.dir/flags.make
CMakeFiles/LoadImage.dir/load.cpp.o: load.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/aambasth/personalProjects/CVcpp/load/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/LoadImage.dir/load.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LoadImage.dir/load.cpp.o -c /Users/aambasth/personalProjects/CVcpp/load/load.cpp

CMakeFiles/LoadImage.dir/load.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LoadImage.dir/load.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/aambasth/personalProjects/CVcpp/load/load.cpp > CMakeFiles/LoadImage.dir/load.cpp.i

CMakeFiles/LoadImage.dir/load.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LoadImage.dir/load.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/aambasth/personalProjects/CVcpp/load/load.cpp -o CMakeFiles/LoadImage.dir/load.cpp.s

CMakeFiles/LoadImage.dir/load.cpp.o.requires:

.PHONY : CMakeFiles/LoadImage.dir/load.cpp.o.requires

CMakeFiles/LoadImage.dir/load.cpp.o.provides: CMakeFiles/LoadImage.dir/load.cpp.o.requires
	$(MAKE) -f CMakeFiles/LoadImage.dir/build.make CMakeFiles/LoadImage.dir/load.cpp.o.provides.build
.PHONY : CMakeFiles/LoadImage.dir/load.cpp.o.provides

CMakeFiles/LoadImage.dir/load.cpp.o.provides.build: CMakeFiles/LoadImage.dir/load.cpp.o


# Object files for target LoadImage
LoadImage_OBJECTS = \
"CMakeFiles/LoadImage.dir/load.cpp.o"

# External object files for target LoadImage
LoadImage_EXTERNAL_OBJECTS =

LoadImage: CMakeFiles/LoadImage.dir/load.cpp.o
LoadImage: CMakeFiles/LoadImage.dir/build.make
LoadImage: /usr/local/lib/libopencv_videostab.3.1.0.dylib
LoadImage: /usr/local/lib/libopencv_superres.3.1.0.dylib
LoadImage: /usr/local/lib/libopencv_stitching.3.1.0.dylib
LoadImage: /usr/local/lib/libopencv_shape.3.1.0.dylib
LoadImage: /usr/local/lib/libopencv_photo.3.1.0.dylib
LoadImage: /usr/local/lib/libopencv_objdetect.3.1.0.dylib
LoadImage: /usr/local/lib/libopencv_calib3d.3.1.0.dylib
LoadImage: /usr/local/lib/libopencv_features2d.3.1.0.dylib
LoadImage: /usr/local/lib/libopencv_ml.3.1.0.dylib
LoadImage: /usr/local/lib/libopencv_highgui.3.1.0.dylib
LoadImage: /usr/local/lib/libopencv_videoio.3.1.0.dylib
LoadImage: /usr/local/lib/libopencv_imgcodecs.3.1.0.dylib
LoadImage: /usr/local/lib/libopencv_flann.3.1.0.dylib
LoadImage: /usr/local/lib/libopencv_video.3.1.0.dylib
LoadImage: /usr/local/lib/libopencv_imgproc.3.1.0.dylib
LoadImage: /usr/local/lib/libopencv_core.3.1.0.dylib
LoadImage: CMakeFiles/LoadImage.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/aambasth/personalProjects/CVcpp/load/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable LoadImage"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LoadImage.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/LoadImage.dir/build: LoadImage

.PHONY : CMakeFiles/LoadImage.dir/build

CMakeFiles/LoadImage.dir/requires: CMakeFiles/LoadImage.dir/load.cpp.o.requires

.PHONY : CMakeFiles/LoadImage.dir/requires

CMakeFiles/LoadImage.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/LoadImage.dir/cmake_clean.cmake
.PHONY : CMakeFiles/LoadImage.dir/clean

CMakeFiles/LoadImage.dir/depend:
	cd /Users/aambasth/personalProjects/CVcpp/load && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/aambasth/personalProjects/CVcpp/load /Users/aambasth/personalProjects/CVcpp/load /Users/aambasth/personalProjects/CVcpp/load /Users/aambasth/personalProjects/CVcpp/load /Users/aambasth/personalProjects/CVcpp/load/CMakeFiles/LoadImage.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/LoadImage.dir/depend

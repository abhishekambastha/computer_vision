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
CMAKE_SOURCE_DIR = /Users/aambasth/personalProjects/CVcpp/morphology

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/aambasth/personalProjects/CVcpp/morphology/build

# Include any dependencies generated for this target.
include CMakeFiles/RegionFill.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/RegionFill.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/RegionFill.dir/flags.make

CMakeFiles/RegionFill.dir/regionFill.cpp.o: CMakeFiles/RegionFill.dir/flags.make
CMakeFiles/RegionFill.dir/regionFill.cpp.o: ../regionFill.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/aambasth/personalProjects/CVcpp/morphology/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/RegionFill.dir/regionFill.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/RegionFill.dir/regionFill.cpp.o -c /Users/aambasth/personalProjects/CVcpp/morphology/regionFill.cpp

CMakeFiles/RegionFill.dir/regionFill.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RegionFill.dir/regionFill.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/aambasth/personalProjects/CVcpp/morphology/regionFill.cpp > CMakeFiles/RegionFill.dir/regionFill.cpp.i

CMakeFiles/RegionFill.dir/regionFill.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RegionFill.dir/regionFill.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/aambasth/personalProjects/CVcpp/morphology/regionFill.cpp -o CMakeFiles/RegionFill.dir/regionFill.cpp.s

CMakeFiles/RegionFill.dir/regionFill.cpp.o.requires:

.PHONY : CMakeFiles/RegionFill.dir/regionFill.cpp.o.requires

CMakeFiles/RegionFill.dir/regionFill.cpp.o.provides: CMakeFiles/RegionFill.dir/regionFill.cpp.o.requires
	$(MAKE) -f CMakeFiles/RegionFill.dir/build.make CMakeFiles/RegionFill.dir/regionFill.cpp.o.provides.build
.PHONY : CMakeFiles/RegionFill.dir/regionFill.cpp.o.provides

CMakeFiles/RegionFill.dir/regionFill.cpp.o.provides.build: CMakeFiles/RegionFill.dir/regionFill.cpp.o


# Object files for target RegionFill
RegionFill_OBJECTS = \
"CMakeFiles/RegionFill.dir/regionFill.cpp.o"

# External object files for target RegionFill
RegionFill_EXTERNAL_OBJECTS =

RegionFill: CMakeFiles/RegionFill.dir/regionFill.cpp.o
RegionFill: CMakeFiles/RegionFill.dir/build.make
RegionFill: /usr/local/lib/libopencv_videostab.3.1.0.dylib
RegionFill: /usr/local/lib/libopencv_superres.3.1.0.dylib
RegionFill: /usr/local/lib/libopencv_stitching.3.1.0.dylib
RegionFill: /usr/local/lib/libopencv_shape.3.1.0.dylib
RegionFill: /usr/local/lib/libopencv_photo.3.1.0.dylib
RegionFill: /usr/local/lib/libopencv_objdetect.3.1.0.dylib
RegionFill: /usr/local/lib/libopencv_calib3d.3.1.0.dylib
RegionFill: /usr/local/lib/libopencv_features2d.3.1.0.dylib
RegionFill: /usr/local/lib/libopencv_ml.3.1.0.dylib
RegionFill: /usr/local/lib/libopencv_highgui.3.1.0.dylib
RegionFill: /usr/local/lib/libopencv_videoio.3.1.0.dylib
RegionFill: /usr/local/lib/libopencv_imgcodecs.3.1.0.dylib
RegionFill: /usr/local/lib/libopencv_flann.3.1.0.dylib
RegionFill: /usr/local/lib/libopencv_video.3.1.0.dylib
RegionFill: /usr/local/lib/libopencv_imgproc.3.1.0.dylib
RegionFill: /usr/local/lib/libopencv_core.3.1.0.dylib
RegionFill: CMakeFiles/RegionFill.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/aambasth/personalProjects/CVcpp/morphology/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable RegionFill"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/RegionFill.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/RegionFill.dir/build: RegionFill

.PHONY : CMakeFiles/RegionFill.dir/build

CMakeFiles/RegionFill.dir/requires: CMakeFiles/RegionFill.dir/regionFill.cpp.o.requires

.PHONY : CMakeFiles/RegionFill.dir/requires

CMakeFiles/RegionFill.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/RegionFill.dir/cmake_clean.cmake
.PHONY : CMakeFiles/RegionFill.dir/clean

CMakeFiles/RegionFill.dir/depend:
	cd /Users/aambasth/personalProjects/CVcpp/morphology/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/aambasth/personalProjects/CVcpp/morphology /Users/aambasth/personalProjects/CVcpp/morphology /Users/aambasth/personalProjects/CVcpp/morphology/build /Users/aambasth/personalProjects/CVcpp/morphology/build /Users/aambasth/personalProjects/CVcpp/morphology/build/CMakeFiles/RegionFill.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/RegionFill.dir/depend

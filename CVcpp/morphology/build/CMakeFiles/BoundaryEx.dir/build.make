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
include CMakeFiles/BoundaryEx.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/BoundaryEx.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/BoundaryEx.dir/flags.make

CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.o: CMakeFiles/BoundaryEx.dir/flags.make
CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.o: ../boundaryExtract.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/aambasth/personalProjects/CVcpp/morphology/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.o -c /Users/aambasth/personalProjects/CVcpp/morphology/boundaryExtract.cpp

CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/aambasth/personalProjects/CVcpp/morphology/boundaryExtract.cpp > CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.i

CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/aambasth/personalProjects/CVcpp/morphology/boundaryExtract.cpp -o CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.s

CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.o.requires:

.PHONY : CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.o.requires

CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.o.provides: CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.o.requires
	$(MAKE) -f CMakeFiles/BoundaryEx.dir/build.make CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.o.provides.build
.PHONY : CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.o.provides

CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.o.provides.build: CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.o


# Object files for target BoundaryEx
BoundaryEx_OBJECTS = \
"CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.o"

# External object files for target BoundaryEx
BoundaryEx_EXTERNAL_OBJECTS =

BoundaryEx: CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.o
BoundaryEx: CMakeFiles/BoundaryEx.dir/build.make
BoundaryEx: CMakeFiles/BoundaryEx.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/aambasth/personalProjects/CVcpp/morphology/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable BoundaryEx"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/BoundaryEx.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/BoundaryEx.dir/build: BoundaryEx

.PHONY : CMakeFiles/BoundaryEx.dir/build

CMakeFiles/BoundaryEx.dir/requires: CMakeFiles/BoundaryEx.dir/boundaryExtract.cpp.o.requires

.PHONY : CMakeFiles/BoundaryEx.dir/requires

CMakeFiles/BoundaryEx.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/BoundaryEx.dir/cmake_clean.cmake
.PHONY : CMakeFiles/BoundaryEx.dir/clean

CMakeFiles/BoundaryEx.dir/depend:
	cd /Users/aambasth/personalProjects/CVcpp/morphology/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/aambasth/personalProjects/CVcpp/morphology /Users/aambasth/personalProjects/CVcpp/morphology /Users/aambasth/personalProjects/CVcpp/morphology/build /Users/aambasth/personalProjects/CVcpp/morphology/build /Users/aambasth/personalProjects/CVcpp/morphology/build/CMakeFiles/BoundaryEx.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/BoundaryEx.dir/depend

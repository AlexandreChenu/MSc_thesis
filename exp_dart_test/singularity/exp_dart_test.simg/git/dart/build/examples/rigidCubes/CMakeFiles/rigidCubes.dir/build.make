# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /git/dart

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /git/dart/build

# Include any dependencies generated for this target.
include examples/rigidCubes/CMakeFiles/rigidCubes.dir/depend.make

# Include the progress variables for this target.
include examples/rigidCubes/CMakeFiles/rigidCubes.dir/progress.make

# Include the compile flags for this target's objects.
include examples/rigidCubes/CMakeFiles/rigidCubes.dir/flags.make

examples/rigidCubes/CMakeFiles/rigidCubes.dir/MyWindow.cpp.o: examples/rigidCubes/CMakeFiles/rigidCubes.dir/flags.make
examples/rigidCubes/CMakeFiles/rigidCubes.dir/MyWindow.cpp.o: ../examples/rigidCubes/MyWindow.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/git/dart/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/rigidCubes/CMakeFiles/rigidCubes.dir/MyWindow.cpp.o"
	cd /git/dart/build/examples/rigidCubes && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rigidCubes.dir/MyWindow.cpp.o -c /git/dart/examples/rigidCubes/MyWindow.cpp

examples/rigidCubes/CMakeFiles/rigidCubes.dir/MyWindow.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rigidCubes.dir/MyWindow.cpp.i"
	cd /git/dart/build/examples/rigidCubes && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /git/dart/examples/rigidCubes/MyWindow.cpp > CMakeFiles/rigidCubes.dir/MyWindow.cpp.i

examples/rigidCubes/CMakeFiles/rigidCubes.dir/MyWindow.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rigidCubes.dir/MyWindow.cpp.s"
	cd /git/dart/build/examples/rigidCubes && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /git/dart/examples/rigidCubes/MyWindow.cpp -o CMakeFiles/rigidCubes.dir/MyWindow.cpp.s

examples/rigidCubes/CMakeFiles/rigidCubes.dir/MyWindow.cpp.o.requires:

.PHONY : examples/rigidCubes/CMakeFiles/rigidCubes.dir/MyWindow.cpp.o.requires

examples/rigidCubes/CMakeFiles/rigidCubes.dir/MyWindow.cpp.o.provides: examples/rigidCubes/CMakeFiles/rigidCubes.dir/MyWindow.cpp.o.requires
	$(MAKE) -f examples/rigidCubes/CMakeFiles/rigidCubes.dir/build.make examples/rigidCubes/CMakeFiles/rigidCubes.dir/MyWindow.cpp.o.provides.build
.PHONY : examples/rigidCubes/CMakeFiles/rigidCubes.dir/MyWindow.cpp.o.provides

examples/rigidCubes/CMakeFiles/rigidCubes.dir/MyWindow.cpp.o.provides.build: examples/rigidCubes/CMakeFiles/rigidCubes.dir/MyWindow.cpp.o


examples/rigidCubes/CMakeFiles/rigidCubes.dir/main.cpp.o: examples/rigidCubes/CMakeFiles/rigidCubes.dir/flags.make
examples/rigidCubes/CMakeFiles/rigidCubes.dir/main.cpp.o: ../examples/rigidCubes/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/git/dart/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object examples/rigidCubes/CMakeFiles/rigidCubes.dir/main.cpp.o"
	cd /git/dart/build/examples/rigidCubes && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rigidCubes.dir/main.cpp.o -c /git/dart/examples/rigidCubes/main.cpp

examples/rigidCubes/CMakeFiles/rigidCubes.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rigidCubes.dir/main.cpp.i"
	cd /git/dart/build/examples/rigidCubes && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /git/dart/examples/rigidCubes/main.cpp > CMakeFiles/rigidCubes.dir/main.cpp.i

examples/rigidCubes/CMakeFiles/rigidCubes.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rigidCubes.dir/main.cpp.s"
	cd /git/dart/build/examples/rigidCubes && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /git/dart/examples/rigidCubes/main.cpp -o CMakeFiles/rigidCubes.dir/main.cpp.s

examples/rigidCubes/CMakeFiles/rigidCubes.dir/main.cpp.o.requires:

.PHONY : examples/rigidCubes/CMakeFiles/rigidCubes.dir/main.cpp.o.requires

examples/rigidCubes/CMakeFiles/rigidCubes.dir/main.cpp.o.provides: examples/rigidCubes/CMakeFiles/rigidCubes.dir/main.cpp.o.requires
	$(MAKE) -f examples/rigidCubes/CMakeFiles/rigidCubes.dir/build.make examples/rigidCubes/CMakeFiles/rigidCubes.dir/main.cpp.o.provides.build
.PHONY : examples/rigidCubes/CMakeFiles/rigidCubes.dir/main.cpp.o.provides

examples/rigidCubes/CMakeFiles/rigidCubes.dir/main.cpp.o.provides.build: examples/rigidCubes/CMakeFiles/rigidCubes.dir/main.cpp.o


# Object files for target rigidCubes
rigidCubes_OBJECTS = \
"CMakeFiles/rigidCubes.dir/MyWindow.cpp.o" \
"CMakeFiles/rigidCubes.dir/main.cpp.o"

# External object files for target rigidCubes
rigidCubes_EXTERNAL_OBJECTS =

bin/rigidCubes: examples/rigidCubes/CMakeFiles/rigidCubes.dir/MyWindow.cpp.o
bin/rigidCubes: examples/rigidCubes/CMakeFiles/rigidCubes.dir/main.cpp.o
bin/rigidCubes: examples/rigidCubes/CMakeFiles/rigidCubes.dir/build.make
bin/rigidCubes: lib/libdart-gui.so.7.0.0
bin/rigidCubes: lib/libdart-io.so.7.0.0
bin/rigidCubes: lib/libdart.so.7.0.0
bin/rigidCubes: dart/external/odelcpsolver/libdart-external-odelcpsolver.so.7.0.0
bin/rigidCubes: /usr/lib/x86_64-linux-gnu/libccd.so
bin/rigidCubes: /usr/lib/x86_64-linux-gnu/libfcl.so
bin/rigidCubes: /usr/lib/x86_64-linux-gnu/libassimp.so
bin/rigidCubes: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
bin/rigidCubes: /usr/lib/x86_64-linux-gnu/libboost_system.so
bin/rigidCubes: /usr/lib/liboctomap.so
bin/rigidCubes: /usr/lib/liboctomath.so
bin/rigidCubes: /usr/lib/x86_64-linux-gnu/libboost_regex.so
bin/rigidCubes: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
bin/rigidCubes: /usr/lib/x86_64-linux-gnu/libglut.so
bin/rigidCubes: /usr/lib/x86_64-linux-gnu/libXmu.so
bin/rigidCubes: /usr/lib/x86_64-linux-gnu/libXi.so
bin/rigidCubes: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/rigidCubes: /usr/lib/x86_64-linux-gnu/libGL.so
bin/rigidCubes: dart/external/lodepng/libdart-external-lodepng.so.7.0.0
bin/rigidCubes: dart/external/imgui/libdart-external-imgui.so.7.0.0
bin/rigidCubes: examples/rigidCubes/CMakeFiles/rigidCubes.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/git/dart/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../../bin/rigidCubes"
	cd /git/dart/build/examples/rigidCubes && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rigidCubes.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/rigidCubes/CMakeFiles/rigidCubes.dir/build: bin/rigidCubes

.PHONY : examples/rigidCubes/CMakeFiles/rigidCubes.dir/build

examples/rigidCubes/CMakeFiles/rigidCubes.dir/requires: examples/rigidCubes/CMakeFiles/rigidCubes.dir/MyWindow.cpp.o.requires
examples/rigidCubes/CMakeFiles/rigidCubes.dir/requires: examples/rigidCubes/CMakeFiles/rigidCubes.dir/main.cpp.o.requires

.PHONY : examples/rigidCubes/CMakeFiles/rigidCubes.dir/requires

examples/rigidCubes/CMakeFiles/rigidCubes.dir/clean:
	cd /git/dart/build/examples/rigidCubes && $(CMAKE_COMMAND) -P CMakeFiles/rigidCubes.dir/cmake_clean.cmake
.PHONY : examples/rigidCubes/CMakeFiles/rigidCubes.dir/clean

examples/rigidCubes/CMakeFiles/rigidCubes.dir/depend:
	cd /git/dart/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /git/dart /git/dart/examples/rigidCubes /git/dart/build /git/dart/build/examples/rigidCubes /git/dart/build/examples/rigidCubes/CMakeFiles/rigidCubes.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/rigidCubes/CMakeFiles/rigidCubes.dir/depend

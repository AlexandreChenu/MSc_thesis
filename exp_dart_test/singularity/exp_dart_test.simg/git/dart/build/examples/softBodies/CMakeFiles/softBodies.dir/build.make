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
include examples/softBodies/CMakeFiles/softBodies.dir/depend.make

# Include the progress variables for this target.
include examples/softBodies/CMakeFiles/softBodies.dir/progress.make

# Include the compile flags for this target's objects.
include examples/softBodies/CMakeFiles/softBodies.dir/flags.make

examples/softBodies/CMakeFiles/softBodies.dir/Main.cpp.o: examples/softBodies/CMakeFiles/softBodies.dir/flags.make
examples/softBodies/CMakeFiles/softBodies.dir/Main.cpp.o: ../examples/softBodies/Main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/git/dart/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/softBodies/CMakeFiles/softBodies.dir/Main.cpp.o"
	cd /git/dart/build/examples/softBodies && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/softBodies.dir/Main.cpp.o -c /git/dart/examples/softBodies/Main.cpp

examples/softBodies/CMakeFiles/softBodies.dir/Main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/softBodies.dir/Main.cpp.i"
	cd /git/dart/build/examples/softBodies && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /git/dart/examples/softBodies/Main.cpp > CMakeFiles/softBodies.dir/Main.cpp.i

examples/softBodies/CMakeFiles/softBodies.dir/Main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/softBodies.dir/Main.cpp.s"
	cd /git/dart/build/examples/softBodies && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /git/dart/examples/softBodies/Main.cpp -o CMakeFiles/softBodies.dir/Main.cpp.s

examples/softBodies/CMakeFiles/softBodies.dir/Main.cpp.o.requires:

.PHONY : examples/softBodies/CMakeFiles/softBodies.dir/Main.cpp.o.requires

examples/softBodies/CMakeFiles/softBodies.dir/Main.cpp.o.provides: examples/softBodies/CMakeFiles/softBodies.dir/Main.cpp.o.requires
	$(MAKE) -f examples/softBodies/CMakeFiles/softBodies.dir/build.make examples/softBodies/CMakeFiles/softBodies.dir/Main.cpp.o.provides.build
.PHONY : examples/softBodies/CMakeFiles/softBodies.dir/Main.cpp.o.provides

examples/softBodies/CMakeFiles/softBodies.dir/Main.cpp.o.provides.build: examples/softBodies/CMakeFiles/softBodies.dir/Main.cpp.o


examples/softBodies/CMakeFiles/softBodies.dir/MyWindow.cpp.o: examples/softBodies/CMakeFiles/softBodies.dir/flags.make
examples/softBodies/CMakeFiles/softBodies.dir/MyWindow.cpp.o: ../examples/softBodies/MyWindow.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/git/dart/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object examples/softBodies/CMakeFiles/softBodies.dir/MyWindow.cpp.o"
	cd /git/dart/build/examples/softBodies && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/softBodies.dir/MyWindow.cpp.o -c /git/dart/examples/softBodies/MyWindow.cpp

examples/softBodies/CMakeFiles/softBodies.dir/MyWindow.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/softBodies.dir/MyWindow.cpp.i"
	cd /git/dart/build/examples/softBodies && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /git/dart/examples/softBodies/MyWindow.cpp > CMakeFiles/softBodies.dir/MyWindow.cpp.i

examples/softBodies/CMakeFiles/softBodies.dir/MyWindow.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/softBodies.dir/MyWindow.cpp.s"
	cd /git/dart/build/examples/softBodies && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /git/dart/examples/softBodies/MyWindow.cpp -o CMakeFiles/softBodies.dir/MyWindow.cpp.s

examples/softBodies/CMakeFiles/softBodies.dir/MyWindow.cpp.o.requires:

.PHONY : examples/softBodies/CMakeFiles/softBodies.dir/MyWindow.cpp.o.requires

examples/softBodies/CMakeFiles/softBodies.dir/MyWindow.cpp.o.provides: examples/softBodies/CMakeFiles/softBodies.dir/MyWindow.cpp.o.requires
	$(MAKE) -f examples/softBodies/CMakeFiles/softBodies.dir/build.make examples/softBodies/CMakeFiles/softBodies.dir/MyWindow.cpp.o.provides.build
.PHONY : examples/softBodies/CMakeFiles/softBodies.dir/MyWindow.cpp.o.provides

examples/softBodies/CMakeFiles/softBodies.dir/MyWindow.cpp.o.provides.build: examples/softBodies/CMakeFiles/softBodies.dir/MyWindow.cpp.o


# Object files for target softBodies
softBodies_OBJECTS = \
"CMakeFiles/softBodies.dir/Main.cpp.o" \
"CMakeFiles/softBodies.dir/MyWindow.cpp.o"

# External object files for target softBodies
softBodies_EXTERNAL_OBJECTS =

bin/softBodies: examples/softBodies/CMakeFiles/softBodies.dir/Main.cpp.o
bin/softBodies: examples/softBodies/CMakeFiles/softBodies.dir/MyWindow.cpp.o
bin/softBodies: examples/softBodies/CMakeFiles/softBodies.dir/build.make
bin/softBodies: lib/libdart-io-urdf.so.7.0.0
bin/softBodies: lib/libdart-gui.so.7.0.0
bin/softBodies: /usr/lib/x86_64-linux-gnu/liburdfdom_sensor.so
bin/softBodies: /usr/lib/x86_64-linux-gnu/liburdfdom_model_state.so
bin/softBodies: /usr/lib/x86_64-linux-gnu/liburdfdom_model.so
bin/softBodies: /usr/lib/x86_64-linux-gnu/liburdfdom_world.so
bin/softBodies: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
bin/softBodies: lib/libdart-io.so.7.0.0
bin/softBodies: lib/libdart.so.7.0.0
bin/softBodies: dart/external/odelcpsolver/libdart-external-odelcpsolver.so.7.0.0
bin/softBodies: /usr/lib/x86_64-linux-gnu/libccd.so
bin/softBodies: /usr/lib/x86_64-linux-gnu/libfcl.so
bin/softBodies: /usr/lib/x86_64-linux-gnu/libassimp.so
bin/softBodies: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
bin/softBodies: /usr/lib/x86_64-linux-gnu/libboost_system.so
bin/softBodies: /usr/lib/liboctomap.so
bin/softBodies: /usr/lib/liboctomath.so
bin/softBodies: /usr/lib/x86_64-linux-gnu/libboost_regex.so
bin/softBodies: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
bin/softBodies: /usr/lib/x86_64-linux-gnu/libglut.so
bin/softBodies: /usr/lib/x86_64-linux-gnu/libXmu.so
bin/softBodies: /usr/lib/x86_64-linux-gnu/libXi.so
bin/softBodies: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/softBodies: /usr/lib/x86_64-linux-gnu/libGL.so
bin/softBodies: dart/external/lodepng/libdart-external-lodepng.so.7.0.0
bin/softBodies: dart/external/imgui/libdart-external-imgui.so.7.0.0
bin/softBodies: examples/softBodies/CMakeFiles/softBodies.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/git/dart/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../../bin/softBodies"
	cd /git/dart/build/examples/softBodies && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/softBodies.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/softBodies/CMakeFiles/softBodies.dir/build: bin/softBodies

.PHONY : examples/softBodies/CMakeFiles/softBodies.dir/build

examples/softBodies/CMakeFiles/softBodies.dir/requires: examples/softBodies/CMakeFiles/softBodies.dir/Main.cpp.o.requires
examples/softBodies/CMakeFiles/softBodies.dir/requires: examples/softBodies/CMakeFiles/softBodies.dir/MyWindow.cpp.o.requires

.PHONY : examples/softBodies/CMakeFiles/softBodies.dir/requires

examples/softBodies/CMakeFiles/softBodies.dir/clean:
	cd /git/dart/build/examples/softBodies && $(CMAKE_COMMAND) -P CMakeFiles/softBodies.dir/cmake_clean.cmake
.PHONY : examples/softBodies/CMakeFiles/softBodies.dir/clean

examples/softBodies/CMakeFiles/softBodies.dir/depend:
	cd /git/dart/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /git/dart /git/dart/examples/softBodies /git/dart/build /git/dart/build/examples/softBodies /git/dart/build/examples/softBodies/CMakeFiles/softBodies.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/softBodies/CMakeFiles/softBodies.dir/depend

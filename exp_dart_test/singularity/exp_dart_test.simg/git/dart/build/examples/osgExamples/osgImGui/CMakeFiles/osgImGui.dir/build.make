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
include examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/depend.make

# Include the progress variables for this target.
include examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/progress.make

# Include the compile flags for this target's objects.
include examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/flags.make

examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/osgImGui.cpp.o: examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/flags.make
examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/osgImGui.cpp.o: ../examples/osgExamples/osgImGui/osgImGui.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/git/dart/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/osgImGui.cpp.o"
	cd /git/dart/build/examples/osgExamples/osgImGui && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/osgImGui.dir/osgImGui.cpp.o -c /git/dart/examples/osgExamples/osgImGui/osgImGui.cpp

examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/osgImGui.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/osgImGui.dir/osgImGui.cpp.i"
	cd /git/dart/build/examples/osgExamples/osgImGui && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /git/dart/examples/osgExamples/osgImGui/osgImGui.cpp > CMakeFiles/osgImGui.dir/osgImGui.cpp.i

examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/osgImGui.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/osgImGui.dir/osgImGui.cpp.s"
	cd /git/dart/build/examples/osgExamples/osgImGui && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /git/dart/examples/osgExamples/osgImGui/osgImGui.cpp -o CMakeFiles/osgImGui.dir/osgImGui.cpp.s

examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/osgImGui.cpp.o.requires:

.PHONY : examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/osgImGui.cpp.o.requires

examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/osgImGui.cpp.o.provides: examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/osgImGui.cpp.o.requires
	$(MAKE) -f examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/build.make examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/osgImGui.cpp.o.provides.build
.PHONY : examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/osgImGui.cpp.o.provides

examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/osgImGui.cpp.o.provides.build: examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/osgImGui.cpp.o


# Object files for target osgImGui
osgImGui_OBJECTS = \
"CMakeFiles/osgImGui.dir/osgImGui.cpp.o"

# External object files for target osgImGui
osgImGui_EXTERNAL_OBJECTS =

bin/osgImGui: examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/osgImGui.cpp.o
bin/osgImGui: examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/build.make
bin/osgImGui: lib/libdart-io-urdf.so.7.0.0
bin/osgImGui: lib/libdart-gui-osg.so.7.0.0
bin/osgImGui: /usr/lib/x86_64-linux-gnu/liburdfdom_sensor.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/liburdfdom_model_state.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/liburdfdom_model.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/liburdfdom_world.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
bin/osgImGui: lib/libdart-gui.so.7.0.0
bin/osgImGui: lib/libdart-io.so.7.0.0
bin/osgImGui: lib/libdart.so.7.0.0
bin/osgImGui: dart/external/odelcpsolver/libdart-external-odelcpsolver.so.7.0.0
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libccd.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libfcl.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libassimp.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libboost_system.so
bin/osgImGui: /usr/lib/liboctomap.so
bin/osgImGui: /usr/lib/liboctomath.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libboost_regex.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libglut.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libXmu.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libXi.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libGLU.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libGL.so
bin/osgImGui: dart/external/lodepng/libdart-external-lodepng.so.7.0.0
bin/osgImGui: dart/external/imgui/libdart-external-imgui.so.7.0.0
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libosg.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libosgViewer.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libosgManipulator.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libosgGA.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libosgDB.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libosgShadow.so
bin/osgImGui: /usr/lib/x86_64-linux-gnu/libOpenThreads.so
bin/osgImGui: examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/git/dart/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/osgImGui"
	cd /git/dart/build/examples/osgExamples/osgImGui && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/osgImGui.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/build: bin/osgImGui

.PHONY : examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/build

examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/requires: examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/osgImGui.cpp.o.requires

.PHONY : examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/requires

examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/clean:
	cd /git/dart/build/examples/osgExamples/osgImGui && $(CMAKE_COMMAND) -P CMakeFiles/osgImGui.dir/cmake_clean.cmake
.PHONY : examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/clean

examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/depend:
	cd /git/dart/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /git/dart /git/dart/examples/osgExamples/osgImGui /git/dart/build /git/dart/build/examples/osgExamples/osgImGui /git/dart/build/examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/osgExamples/osgImGui/CMakeFiles/osgImGui.dir/depend


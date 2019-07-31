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
include unittests/unit/CMakeFiles/test_CollisionGroups.dir/depend.make

# Include the progress variables for this target.
include unittests/unit/CMakeFiles/test_CollisionGroups.dir/progress.make

# Include the compile flags for this target's objects.
include unittests/unit/CMakeFiles/test_CollisionGroups.dir/flags.make

unittests/unit/CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.o: unittests/unit/CMakeFiles/test_CollisionGroups.dir/flags.make
unittests/unit/CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.o: ../unittests/unit/test_CollisionGroups.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/git/dart/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object unittests/unit/CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.o"
	cd /git/dart/build/unittests/unit && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.o -c /git/dart/unittests/unit/test_CollisionGroups.cpp

unittests/unit/CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.i"
	cd /git/dart/build/unittests/unit && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /git/dart/unittests/unit/test_CollisionGroups.cpp > CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.i

unittests/unit/CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.s"
	cd /git/dart/build/unittests/unit && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /git/dart/unittests/unit/test_CollisionGroups.cpp -o CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.s

unittests/unit/CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.o.requires:

.PHONY : unittests/unit/CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.o.requires

unittests/unit/CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.o.provides: unittests/unit/CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.o.requires
	$(MAKE) -f unittests/unit/CMakeFiles/test_CollisionGroups.dir/build.make unittests/unit/CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.o.provides.build
.PHONY : unittests/unit/CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.o.provides

unittests/unit/CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.o.provides.build: unittests/unit/CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.o


# Object files for target test_CollisionGroups
test_CollisionGroups_OBJECTS = \
"CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.o"

# External object files for target test_CollisionGroups
test_CollisionGroups_EXTERNAL_OBJECTS =

unittests/unit/test_CollisionGroups: unittests/unit/CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.o
unittests/unit/test_CollisionGroups: unittests/unit/CMakeFiles/test_CollisionGroups.dir/build.make
unittests/unit/test_CollisionGroups: lib/libgtest.a
unittests/unit/test_CollisionGroups: unittests/libgtest_main.a
unittests/unit/test_CollisionGroups: lib/libdart-collision-bullet.so.7.0.0
unittests/unit/test_CollisionGroups: lib/libdart-collision-ode.so.7.0.0
unittests/unit/test_CollisionGroups: lib/libgtest.a
unittests/unit/test_CollisionGroups: /usr/lib/x86_64-linux-gnu/libBulletDynamics.so
unittests/unit/test_CollisionGroups: /usr/lib/x86_64-linux-gnu/libBulletCollision.so
unittests/unit/test_CollisionGroups: /usr/lib/x86_64-linux-gnu/libLinearMath.so
unittests/unit/test_CollisionGroups: /usr/lib/x86_64-linux-gnu/libBulletSoftBody.so
unittests/unit/test_CollisionGroups: lib/libdart.so.7.0.0
unittests/unit/test_CollisionGroups: dart/external/odelcpsolver/libdart-external-odelcpsolver.so.7.0.0
unittests/unit/test_CollisionGroups: /usr/lib/x86_64-linux-gnu/libccd.so
unittests/unit/test_CollisionGroups: /usr/lib/x86_64-linux-gnu/libfcl.so
unittests/unit/test_CollisionGroups: /usr/lib/x86_64-linux-gnu/libassimp.so
unittests/unit/test_CollisionGroups: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
unittests/unit/test_CollisionGroups: /usr/lib/x86_64-linux-gnu/libboost_system.so
unittests/unit/test_CollisionGroups: /usr/lib/liboctomap.so
unittests/unit/test_CollisionGroups: /usr/lib/liboctomath.so
unittests/unit/test_CollisionGroups: /usr/lib/x86_64-linux-gnu/libboost_regex.so
unittests/unit/test_CollisionGroups: /usr/lib/x86_64-linux-gnu/libode.so
unittests/unit/test_CollisionGroups: unittests/unit/CMakeFiles/test_CollisionGroups.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/git/dart/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test_CollisionGroups"
	cd /git/dart/build/unittests/unit && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_CollisionGroups.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
unittests/unit/CMakeFiles/test_CollisionGroups.dir/build: unittests/unit/test_CollisionGroups

.PHONY : unittests/unit/CMakeFiles/test_CollisionGroups.dir/build

unittests/unit/CMakeFiles/test_CollisionGroups.dir/requires: unittests/unit/CMakeFiles/test_CollisionGroups.dir/test_CollisionGroups.cpp.o.requires

.PHONY : unittests/unit/CMakeFiles/test_CollisionGroups.dir/requires

unittests/unit/CMakeFiles/test_CollisionGroups.dir/clean:
	cd /git/dart/build/unittests/unit && $(CMAKE_COMMAND) -P CMakeFiles/test_CollisionGroups.dir/cmake_clean.cmake
.PHONY : unittests/unit/CMakeFiles/test_CollisionGroups.dir/clean

unittests/unit/CMakeFiles/test_CollisionGroups.dir/depend:
	cd /git/dart/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /git/dart /git/dart/unittests/unit /git/dart/build /git/dart/build/unittests/unit /git/dart/build/unittests/unit/CMakeFiles/test_CollisionGroups.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : unittests/unit/CMakeFiles/test_CollisionGroups.dir/depend

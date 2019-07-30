# Install script for directory: /git/dart/examples

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/workspace")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/git/dart/build/examples/addDeleteSkels/cmake_install.cmake")
  include("/git/dart/build/examples/atlasSimbicon/cmake_install.cmake")
  include("/git/dart/build/examples/bipedStand/cmake_install.cmake")
  include("/git/dart/build/examples/hardcodedDesign/cmake_install.cmake")
  include("/git/dart/build/examples/hybridDynamics/cmake_install.cmake")
  include("/git/dart/build/examples/jointConstraints/cmake_install.cmake")
  include("/git/dart/build/examples/mixedChain/cmake_install.cmake")
  include("/git/dart/build/examples/operationalSpaceControl/cmake_install.cmake")
  include("/git/dart/build/examples/rigidChain/cmake_install.cmake")
  include("/git/dart/build/examples/rigidCubes/cmake_install.cmake")
  include("/git/dart/build/examples/rigidLoop/cmake_install.cmake")
  include("/git/dart/build/examples/rigidShapes/cmake_install.cmake")
  include("/git/dart/build/examples/simpleFrames/cmake_install.cmake")
  include("/git/dart/build/examples/softBodies/cmake_install.cmake")
  include("/git/dart/build/examples/speedTest/cmake_install.cmake")
  include("/git/dart/build/examples/vehicle/cmake_install.cmake")
  include("/git/dart/build/examples/humanJointLimits/cmake_install.cmake")
  include("/git/dart/build/examples/osgExamples/cmake_install.cmake")

endif()


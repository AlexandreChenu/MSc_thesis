# Install script for directory: /git/dart/dart/gui/glut

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xheadersx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/gui/glut" TYPE FILE FILES
    "/git/dart/dart/gui/glut/GLUTFuncs.hpp"
    "/git/dart/dart/gui/glut/GraphWindow.hpp"
    "/git/dart/dart/gui/glut/LoadGlut.hpp"
    "/git/dart/dart/gui/glut/MotionBlurSimWindow.hpp"
    "/git/dart/dart/gui/glut/SimWindow.hpp"
    "/git/dart/dart/gui/glut/SoftSimWindow.hpp"
    "/git/dart/dart/gui/glut/Win2D.hpp"
    "/git/dart/dart/gui/glut/Win3D.hpp"
    "/git/dart/dart/gui/glut/Window.hpp"
    "/git/dart/build/dart/gui/glut/glut.hpp"
    )
endif()


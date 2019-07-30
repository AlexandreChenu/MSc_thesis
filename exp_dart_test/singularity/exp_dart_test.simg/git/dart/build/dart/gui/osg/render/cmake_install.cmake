# Install script for directory: /git/dart/dart/gui/osg/render

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/gui/osg/render" TYPE FILE FILES
    "/git/dart/dart/gui/osg/render/BoxShapeNode.hpp"
    "/git/dart/dart/gui/osg/render/CapsuleShapeNode.hpp"
    "/git/dart/dart/gui/osg/render/ConeShapeNode.hpp"
    "/git/dart/dart/gui/osg/render/CylinderShapeNode.hpp"
    "/git/dart/dart/gui/osg/render/EllipsoidShapeNode.hpp"
    "/git/dart/dart/gui/osg/render/LineSegmentShapeNode.hpp"
    "/git/dart/dart/gui/osg/render/MeshShapeNode.hpp"
    "/git/dart/dart/gui/osg/render/MultiSphereShapeNode.hpp"
    "/git/dart/dart/gui/osg/render/PlaneShapeNode.hpp"
    "/git/dart/dart/gui/osg/render/ShapeNode.hpp"
    "/git/dart/dart/gui/osg/render/SoftMeshShapeNode.hpp"
    "/git/dart/dart/gui/osg/render/SphereShapeNode.hpp"
    "/git/dart/dart/gui/osg/render/WarningShapeNode.hpp"
    "/git/dart/build/dart/gui/osg/render/render.hpp"
    )
endif()


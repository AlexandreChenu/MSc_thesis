# Install script for directory: /git/dart/dart/common

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/common" TYPE FILE FILES
    "/git/dart/dart/common/Aspect.hpp"
    "/git/dart/dart/common/AspectWithVersion.hpp"
    "/git/dart/dart/common/Cloneable.hpp"
    "/git/dart/dart/common/Composite.hpp"
    "/git/dart/dart/common/CompositeJoiner.hpp"
    "/git/dart/dart/common/Console.hpp"
    "/git/dart/dart/common/Deprecated.hpp"
    "/git/dart/dart/common/EmbeddedAspect.hpp"
    "/git/dart/dart/common/Empty.hpp"
    "/git/dart/dart/common/Factory.hpp"
    "/git/dart/dart/common/LocalResource.hpp"
    "/git/dart/dart/common/LocalResourceRetriever.hpp"
    "/git/dart/dart/common/LockableReference.hpp"
    "/git/dart/dart/common/Memory.hpp"
    "/git/dart/dart/common/NameManager.hpp"
    "/git/dart/dart/common/Observer.hpp"
    "/git/dart/dart/common/Platform.hpp"
    "/git/dart/dart/common/ProxyAspect.hpp"
    "/git/dart/dart/common/RequiresAspect.hpp"
    "/git/dart/dart/common/Resource.hpp"
    "/git/dart/dart/common/ResourceRetriever.hpp"
    "/git/dart/dart/common/SharedLibrary.hpp"
    "/git/dart/dart/common/Signal.hpp"
    "/git/dart/dart/common/Singleton.hpp"
    "/git/dart/dart/common/SmartPointer.hpp"
    "/git/dart/dart/common/SpecializedForAspect.hpp"
    "/git/dart/dart/common/StlHelpers.hpp"
    "/git/dart/dart/common/Subject.hpp"
    "/git/dart/dart/common/Timer.hpp"
    "/git/dart/dart/common/Uri.hpp"
    "/git/dart/dart/common/VersionCounter.hpp"
    "/git/dart/dart/common/Virtual.hpp"
    "/git/dart/dart/common/sub_ptr.hpp"
    "/git/dart/build/dart/common/common.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xheadersx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/common/detail" TYPE FILE FILES
    "/git/dart/dart/common/detail/AlignedAllocator.hpp"
    "/git/dart/dart/common/detail/Aspect.hpp"
    "/git/dart/dart/common/detail/AspectWithVersion.hpp"
    "/git/dart/dart/common/detail/Cloneable.hpp"
    "/git/dart/dart/common/detail/Composite.hpp"
    "/git/dart/dart/common/detail/CompositeData.hpp"
    "/git/dart/dart/common/detail/CompositeJoiner.hpp"
    "/git/dart/dart/common/detail/ConnectionBody.hpp"
    "/git/dart/dart/common/detail/EmbeddedAspect.hpp"
    "/git/dart/dart/common/detail/Factory-impl.hpp"
    "/git/dart/dart/common/detail/LockableReference-impl.hpp"
    "/git/dart/dart/common/detail/Memory-impl.hpp"
    "/git/dart/dart/common/detail/NameManager.hpp"
    "/git/dart/dart/common/detail/NoOp.hpp"
    "/git/dart/dart/common/detail/ProxyAspect.hpp"
    "/git/dart/dart/common/detail/RequiresAspect.hpp"
    "/git/dart/dart/common/detail/SharedLibraryManager.hpp"
    "/git/dart/dart/common/detail/Signal.hpp"
    "/git/dart/dart/common/detail/Singleton-impl.hpp"
    "/git/dart/dart/common/detail/SpecializedForAspect.hpp"
    "/git/dart/dart/common/detail/TemplateJoinerDispatchMacro.hpp"
    "/git/dart/dart/common/detail/sub_ptr.hpp"
    )
endif()


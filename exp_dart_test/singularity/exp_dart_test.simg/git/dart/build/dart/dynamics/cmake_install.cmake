# Install script for directory: /git/dart/dart/dynamics

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/dynamics" TYPE FILE FILES
    "/git/dart/dart/dynamics/ArrowShape.hpp"
    "/git/dart/dart/dynamics/AssimpInputResourceAdaptor.hpp"
    "/git/dart/dart/dynamics/BallJoint.hpp"
    "/git/dart/dart/dynamics/BodyNode.hpp"
    "/git/dart/dart/dynamics/BoxShape.hpp"
    "/git/dart/dart/dynamics/Branch.hpp"
    "/git/dart/dart/dynamics/CapsuleShape.hpp"
    "/git/dart/dart/dynamics/Chain.hpp"
    "/git/dart/dart/dynamics/CompositeNode.hpp"
    "/git/dart/dart/dynamics/ConeShape.hpp"
    "/git/dart/dart/dynamics/CylinderShape.hpp"
    "/git/dart/dart/dynamics/DegreeOfFreedom.hpp"
    "/git/dart/dart/dynamics/EllipsoidShape.hpp"
    "/git/dart/dart/dynamics/EndEffector.hpp"
    "/git/dart/dart/dynamics/Entity.hpp"
    "/git/dart/dart/dynamics/EntityNode.hpp"
    "/git/dart/dart/dynamics/EulerJoint.hpp"
    "/git/dart/dart/dynamics/FixedFrame.hpp"
    "/git/dart/dart/dynamics/FixedJacobianNode.hpp"
    "/git/dart/dart/dynamics/Frame.hpp"
    "/git/dart/dart/dynamics/FreeJoint.hpp"
    "/git/dart/dart/dynamics/GenericJoint.hpp"
    "/git/dart/dart/dynamics/Group.hpp"
    "/git/dart/dart/dynamics/HeightmapShape.hpp"
    "/git/dart/dart/dynamics/HierarchicalIK.hpp"
    "/git/dart/dart/dynamics/IkFast.hpp"
    "/git/dart/dart/dynamics/Inertia.hpp"
    "/git/dart/dart/dynamics/InvalidIndex.hpp"
    "/git/dart/dart/dynamics/InverseKinematics.hpp"
    "/git/dart/dart/dynamics/JacobianNode.hpp"
    "/git/dart/dart/dynamics/Joint.hpp"
    "/git/dart/dart/dynamics/LineSegmentShape.hpp"
    "/git/dart/dart/dynamics/Linkage.hpp"
    "/git/dart/dart/dynamics/Marker.hpp"
    "/git/dart/dart/dynamics/MeshShape.hpp"
    "/git/dart/dart/dynamics/MetaSkeleton.hpp"
    "/git/dart/dart/dynamics/MultiSphereConvexHullShape.hpp"
    "/git/dart/dart/dynamics/MultiSphereShape.hpp"
    "/git/dart/dart/dynamics/Node.hpp"
    "/git/dart/dart/dynamics/NodeManagerJoiner.hpp"
    "/git/dart/dart/dynamics/PlanarJoint.hpp"
    "/git/dart/dart/dynamics/PlaneShape.hpp"
    "/git/dart/dart/dynamics/PointMass.hpp"
    "/git/dart/dart/dynamics/PrismaticJoint.hpp"
    "/git/dart/dart/dynamics/ReferentialSkeleton.hpp"
    "/git/dart/dart/dynamics/RevoluteJoint.hpp"
    "/git/dart/dart/dynamics/ScrewJoint.hpp"
    "/git/dart/dart/dynamics/Shape.hpp"
    "/git/dart/dart/dynamics/ShapeFrame.hpp"
    "/git/dart/dart/dynamics/ShapeNode.hpp"
    "/git/dart/dart/dynamics/SharedLibraryIkFast.hpp"
    "/git/dart/dart/dynamics/SimpleFrame.hpp"
    "/git/dart/dart/dynamics/Skeleton.hpp"
    "/git/dart/dart/dynamics/SmartPointer.hpp"
    "/git/dart/dart/dynamics/SoftBodyNode.hpp"
    "/git/dart/dart/dynamics/SoftMeshShape.hpp"
    "/git/dart/dart/dynamics/SpecializedNodeManager.hpp"
    "/git/dart/dart/dynamics/SphereShape.hpp"
    "/git/dart/dart/dynamics/TemplatedJacobianNode.hpp"
    "/git/dart/dart/dynamics/TranslationalJoint.hpp"
    "/git/dart/dart/dynamics/TranslationalJoint2D.hpp"
    "/git/dart/dart/dynamics/UniversalJoint.hpp"
    "/git/dart/dart/dynamics/VoxelGridShape.hpp"
    "/git/dart/dart/dynamics/WeldJoint.hpp"
    "/git/dart/dart/dynamics/ZeroDofJoint.hpp"
    "/git/dart/build/dart/dynamics/dynamics.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xheadersx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dart/dynamics/detail" TYPE FILE FILES
    "/git/dart/dart/dynamics/detail/BasicNodeManager.hpp"
    "/git/dart/dart/dynamics/detail/BodyNode.hpp"
    "/git/dart/dart/dynamics/detail/BodyNodeAspect.hpp"
    "/git/dart/dart/dynamics/detail/BodyNodePtr.hpp"
    "/git/dart/dart/dynamics/detail/CompositeNode.hpp"
    "/git/dart/dart/dynamics/detail/DegreeOfFreedomPtr.hpp"
    "/git/dart/dart/dynamics/detail/EndEffectorAspect.hpp"
    "/git/dart/dart/dynamics/detail/EntityNode.hpp"
    "/git/dart/dart/dynamics/detail/EntityNodeAspect.hpp"
    "/git/dart/dart/dynamics/detail/EulerJointAspect.hpp"
    "/git/dart/dart/dynamics/detail/FixedFrameAspect.hpp"
    "/git/dart/dart/dynamics/detail/FixedJacobianNode.hpp"
    "/git/dart/dart/dynamics/detail/GenericJoint.hpp"
    "/git/dart/dart/dynamics/detail/GenericJointAspect.hpp"
    "/git/dart/dart/dynamics/detail/HeightmapShape-impl.hpp"
    "/git/dart/dart/dynamics/detail/InverseKinematics.hpp"
    "/git/dart/dart/dynamics/detail/InverseKinematicsPtr.hpp"
    "/git/dart/dart/dynamics/detail/JointAspect.hpp"
    "/git/dart/dart/dynamics/detail/JointPtr.hpp"
    "/git/dart/dart/dynamics/detail/MarkerAspect.hpp"
    "/git/dart/dart/dynamics/detail/Node.hpp"
    "/git/dart/dart/dynamics/detail/NodeManagerJoiner.hpp"
    "/git/dart/dart/dynamics/detail/NodePtr.hpp"
    "/git/dart/dart/dynamics/detail/PlanarJointAspect.hpp"
    "/git/dart/dart/dynamics/detail/PrismaticJointAspect.hpp"
    "/git/dart/dart/dynamics/detail/RevoluteJointAspect.hpp"
    "/git/dart/dart/dynamics/detail/ScrewJointAspect.hpp"
    "/git/dart/dart/dynamics/detail/Shape.hpp"
    "/git/dart/dart/dynamics/detail/ShapeFrameAspect.hpp"
    "/git/dart/dart/dynamics/detail/ShapeNode.hpp"
    "/git/dart/dart/dynamics/detail/Skeleton.hpp"
    "/git/dart/dart/dynamics/detail/SkeletonAspect.hpp"
    "/git/dart/dart/dynamics/detail/SoftBodyNodeAspect.hpp"
    "/git/dart/dart/dynamics/detail/SpecializedNodeManager.hpp"
    "/git/dart/dart/dynamics/detail/TemplatedJacobianNode.hpp"
    "/git/dart/dart/dynamics/detail/TranslationalJoint2DAspect.hpp"
    "/git/dart/dart/dynamics/detail/UniversalJointAspect.hpp"
    )
endif()


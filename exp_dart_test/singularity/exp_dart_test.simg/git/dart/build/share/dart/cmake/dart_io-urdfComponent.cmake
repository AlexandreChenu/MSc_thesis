set("dart_io-urdf_DEPENDENCIES" io)
set("dart_io-urdf_LIBRARIES" dart-io-urdf)

foreach(external_dep urdfdom)
  include(${CMAKE_CURRENT_LIST_DIR}/DARTFind${external_dep}.cmake)

  string(TOUPPER ${external_dep} EXTERNAL_DEP_UPPER)
  if(NOT ${external_dep}_FOUND AND NOT ${EXTERNAL_DEP_UPPER}_FOUND)
    set_property(DIRECTORY PROPERTY DART_io-urdf_FOUND FALSE)
    if(NOT DART_FIND_QUIETLY)
      message(WARNING
        "Cannot retrieve dart-io-urdf because the dependency "
        "${external_dep} could not be found. This usually indicates a broken "
        "installation.")
    endif()
  endif()

endforeach()

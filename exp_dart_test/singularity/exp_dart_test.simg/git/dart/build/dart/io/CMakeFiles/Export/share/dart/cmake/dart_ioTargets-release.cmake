#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "dart-io" for configuration "Release"
set_property(TARGET dart-io APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(dart-io PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libdart-io.so.7.0.0"
  IMPORTED_SONAME_RELEASE "libdart-io.so.7.0"
  )

list(APPEND _IMPORT_CHECK_TARGETS dart-io )
list(APPEND _IMPORT_CHECK_FILES_FOR_dart-io "${_IMPORT_PREFIX}/lib/libdart-io.so.7.0.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
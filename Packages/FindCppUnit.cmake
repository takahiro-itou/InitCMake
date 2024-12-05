
set(CppUnit_FOUND   FALSE)

Include (FindPackageHandleStandardArgs)

If ( NOT ( "${CPPUNIT_DIR}" STREQUAL "no" ) )
    find_path(
        cppunit_include_dir
        NAMES   cppunit/extensions/HelperMacros.h
        PATHS
            ${CPPUNIT_DIR}/include
            /usr/include
            /usr/local/include
    )

    find_library(
        cppunit_library
        NAMES   cppunit
        PATHS
            ${CPPUNIT_DIR}/lib
            /usr/lib
            /usr/local/lib
        )

    find_package_handle_standard_args(
        CppUnit     DEFAULT_MSG
        cppunit_library
        cppunit_include_dir
    )
EndIf ()

If ( cppunit_include_dir )
    If ( cppunit_library )
            message(STATUS  "CppUnit is enabled.")
    Else ()
        message(WARNING "Could not find cppunit library.")
    EndIf ()
Else ()
    message(WARNING "Could not find cppunit includes.")
EndIf ()

message(STATUS  "CppUnit_FOUND       = ${CppUnit_FOUND}")
message(STATUS  "cppunit_include_dir = ${cppunit_include_dir}")
message(STATUS  "cppunit_library     = ${cppunit_library}")

If ( NOT TARGET TestDriver::CppUnit )
    If ( CppUnit_FOUND )
        add_library(TestDriver::CppUnit     UNKNOWN     IMPORTED)
        set_target_properties(TestDriver::CppUnit
            PROPERTIES
            IMPORTED_LINK_INTERFACE_LANGUAGES   "CXX"
            IMPORTED_LOCATION                   "${cppunit_library}"
            INTERFACE_COMPILE_DEFINITIONS       "HAVE_CPPUNIT=1"
            INTERFACE_INCLUDE_DIRECTORIES       "${cppunit_include_dir}"
        )
        message(STATUS  "Define target TestDriver::CppUnit")
    Else ()
        add_library(TestDriver::CppUnit     INTERFACE   IMPORTED)
        set_target_properties(TestDriver::CppUnit
            PROPERTIES
            INTERFACE_COMPILE_DEFINITIONS       "HAVE_CPPUNIT=0"
        )
        message(STATUS  "Define target TestDriver::CppUnit")
    EndIf ()
EndIf ()

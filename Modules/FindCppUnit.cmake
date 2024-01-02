
set(CPPUNIT_FOUND   "NO")

find_path(
    CPPUNIT_INCLUDE_DIR
    NAMES   cppunit/extensions/HelperMacros.h
    PATHS
        ${CPPUNIT_DIR}/include
        /usr/include
        /usr/local/include
)

find_library(
    CPPUNIT_LIBRARY
    NAMES   cppunit
    PATHS
        ${CPPUNIT_DIR}/lib
        /usr/lib
        /usr/local/lib
)

If ( CPPUNIT_INCLUDE_DIR )
    If ( CPPUNIT_LIBRARY )
        set(CPPUNIT_FOUND   "YES")
        set(CPPUNIT_LIBRARIES  ${CPPUNIT_LIBRARY} ${CMAKE_DL_LIBS})
    Else ()
        message(STATUS  "Could not find cppunit library.")
    EndIf ()
Else ()
    message(STATUS  "Could not find cppunit includes.")
EndIf ()

message(STATUS  "CPPUNIT_FOUND       = ${CPPUNIT_FOUND}")
message(STATUS  "CPPUNIT_INCLUDE_DIR = ${CPPUNIT_INCLUDE_DIR}")
message(STATUS  "CPPUNIT_LIBRARIES   = ${CPPUNIT_LIBRARIES}")

If ( CPPUNIT_FOUND AND NOT TARGET CPPUNIT::CPPUNIT )
    add_library(CPPUNIT::CPPUNIT    UNKNOWN IMPORTED)
    set_target_properties(CPPUNIT::CPPUNIT  PROPERTIES
        IMPORTED_LINK_INTERFACE_LANGUAGES   "CXX"
        IMPORTED_LOCATION                   "${CPPUNIT_LIBRARY}"
        INTERFACE_INCLUDE_DIRECTORIES       "${CPPUNIT_INCLUDE_DIR}"
        COMPILE_DEFINITIONS                 "HAVE_CPPUNIT=1"
    )
Else ()
    add_library(CPPUNIT::CPPUNIT    INTERFACE)
    set_target_properties(CPPUNIT::CPPUNIT  PROPERTIES
        COMPILE_DEFINITIONS                 "HAVE_CPPUNIT=0"
    )
EndIf()

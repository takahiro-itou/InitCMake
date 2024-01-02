
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


##----------------------------------------------------------------
##
##    デフォルトのコンパイルオプション。
##

If (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE    Release)
EndIf ()

message("Build Type = ${CMAKE_BUILD_TYPE}")

set(CXX_WARNING_FLAGS       "-Wall -Weffc++")
set(C_WARNING_FLAGS         "-Wall")

set(CMAKE_CXX_FLAGS         "${CMAKE_CXX_FLAGS} ${CXX_WARNING_FLAGS}")
set(CMAKE_C_FLAGS           "${CMAKE_C_FLAGS}   ${C_WARNING_FLAGS}")

set(CMAKE_CXX_FLAGS_DEBUG       "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG")
set(CMAKE_C_FLAGS_DEBUG         "${CMAKE_C_FLAGS_DEBUG}   -D_DEBUG")

# set(CMAKE_CXX_FLAGS_RELEASE     "${CMAKE_CXX_FLAGS_RELEASE} -DNDEBUG")
# set(CMAKE_C_FLAGS_RELEASE       "${CMAKE_C_FLAGS_RELEASE}   -DNDEBUG")

enable_testing()

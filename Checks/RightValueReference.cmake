
Include (CheckCXXSourceCompiles)

##
##  Check Compiler Accepts Right Value Reference.
##

check_cxx_source_compiles(
   "#include  <string>

    int  func(std::string  && x) {
        return ( x.length() );
    }

    int main () {
        std::string  test(\"test\");
        int ret = func( std::move(test) );
        return ( ret );
    }"
    CMAKE_CHECK_CXX_RVALUEREF_ENABLED
)
If ( CMAKE_CHECK_CXX_RVALUEREF_ENABLED )
    set(CONFIG_CHECK_CXX_RVALUEREF_ENABLED  1)
Else  ()
    set(CONFIG_CHECK_CXX_RVALUEREF_ENABLED  0)
EndIf ()

##
##  Check Compiler Warns Pessimizing Move.
##

set(SAVE_CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS}")
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS}  -Werror  -Wall")
check_cxx_source_compiles(
   "constexpr  int  a = 0;
    int main () {
        return ( a );
    }"
    CMAKE_CHECK_CXX_PESSIMIZING_MOVE_ENABLED
)
set(CMAKE_CXX_FLAGS  "${SAVE_CMAKE_CXX_FLAGS}")
If ( CMAKE_CHECK_CXX_PESSIMIZING_MOVE_ENABLED )
    set(CONFIG_CHECK_CXX_PESSIMIZING_MOVE_ERROR     0)
Else  ()
    set(CONFIG_CHECK_CXX_PESSIMIZING_MOVE_ERROR     1)
EndIf ()

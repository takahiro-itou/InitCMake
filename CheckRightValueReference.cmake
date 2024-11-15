
Include (CheckCXXSourceCompiles)

##
##  Check Compiler Accepts Right Value Reference.
##

Check_CXX_Source_Compiles (
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
    Set (CONFIG_CHECK_CXX_RVALUEREF_ENABLED  1)
Else  ()
    Set (CONFIG_CHECK_CXX_RVALUEREF_ENABLED  0)
EndIf ()

##
##  Check Compiler Warns Pessimizing Move.
##

Set (SAVE_CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS}")
Set (CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS}  -Werror  -Wall")
Check_CXX_Source_Compiles (
   "constexpr  int  a = 0;
    int main () {
        return ( a );
    }"
    CMAKE_CHECK_CXX_PESSIMIZING_MOVE_ENABLED
)
Set (CMAKE_CXX_FLAGS  "${SAVE_CMAKE_CXX_FLAGS}")
If ( CMAKE_CHECK_CXX_PESSIMIZING_MOVE_ENABLED )
    Set (CONFIG_CHECK_CXX_PESSIMIZING_MOVE_ERROR  0)
Else  ()
    Set (CONFIG_CHECK_CXX_PESSIMIZING_MOVE_ERROR  1)
EndIf ()


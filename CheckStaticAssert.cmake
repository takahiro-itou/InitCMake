
Include (CheckCXXSourceCompiles)

check_cxx_source_compiles(
   "int main () {
        static_assert(1,  \"Compile Error Message\");
        return ( 0 );
    }"
    CMAKE_CHECK_CXX_STATIC_ASSERT_ENABLED
)
If ( CMAKE_CHECK_CXX_STATIC_ASSERT_ENABLED )
    set(CONFIG_CHECK_CXX_STATIC_ASSERT_ENABLED  1)
Else()
    set(CONFIG_CHECK_CXX_STATIC_ASSERT_ENABLED  0)
EndIf()

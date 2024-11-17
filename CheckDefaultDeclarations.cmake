
Include (CheckCXXSourceCompiles)

##
##  Check Compiler Accepts 'Copy Ctor' default/delete.
##

check_cxx_source_compiles(
   "class Test { public:
        Test(const Test &) = default;
    };
    int main () { return ( 0 ); }"
    CMAKE_CHECK_CXX_COPYCTOR_DEFAULT_ENABLED
)
If ( CMAKE_CHECK_CXX_COPYCTOR_DEFAULT_ENABLED )
    set(CONFIG_CHECK_CXX_COPYCTOR_DEFAULT_ENABLED   1)
Else  ()
    set(CONFIG_CHECK_CXX_COPYCTOR_DEFAULT_ENABLED   0)
EndIf ()

check_cxx_source_compiles(
   "class Test { public:
        Test(const Test &) = delete;
    };
    int main () { return ( 0 ); }"
    CMAKE_CHECK_CXX_COPYCTOR_DELETE_ENABLED
)
If ( CMAKE_CHECK_CXX_COPYCTOR_DELETE_ENABLED )
    set(CONFIG_CHECK_CXX_COPYCTOR_DELETE_ENABLED    1)
Else  ()
    set(CONFIG_CHECK_CXX_COPYCTOR_DELETE_ENABLED    0)
EndIf ()

##
##  Check Compiler Accepts 'Copy Operator Equal' default/delete.
##

check_cxx_source_compiles(
   "class Test { public:
        Test & operator = (const Test &) = default;
    };
    int main () { return ( 0 ); }"
    CMAKE_CHECK_CXX_COPYOPEQ_DEFAULT_ENABLED
)
If ( CMAKE_CHECK_CXX_COPYOPEQ_DEFAULT_ENABLED )
    set(CONFIG_CHECK_CXX_COPYOPEQ_DEFAULT_ENABLED   1)
Else  ()
    set(CONFIG_CHECK_CXX_COPYOPEQ_DEFAULT_ENABLED   0)
EndIf ()

check_cxx_source_compiles(
   "class Test { public:
        Test & operator = (const Test &) = delete;
    };
    int main () { return ( 0 ); }"
    CMAKE_CHECK_CXX_COPYOPEQ_DELETE_ENABLED
)
If ( CMAKE_CHECK_CXX_COPYOPEQ_DELETE_ENABLED )
    set(CONFIG_CHECK_CXX_COPYOPEQ_DELETE_ENABLED    1)
Else  ()
    set(CONFIG_CHECK_CXX_COPYOPEQ_DELETE_ENABLED    0)
EndIf ()

##  Check Compiler Accepts 'Move Ctor' declare/default/delete.

check_cxx_source_compiles(
   "class Test { public:
        Test(Test &&) { }
    };
    int main () { return ( 0 ); }"
    CMAKE_CHECK_CXX_MOVECTOR_DECLARE_ENABLED
)
If ( CMAKE_CHECK_CXX_MOVECTOR_DECLARE_ENABLED )
    set(CONFIG_CHECK_CXX_MOVECTOR_DECLARE_ENABLED   1)
Else  ()
    set(CONFIG_CHECK_CXX_MOVECTOR_DECLARE_ENABLED   0)
EndIf ()

check_cxx_source_compiles(
   "class Test { public:
        Test(Test &&) = default;
    };
    int main () { return ( 0 ); }"
    CMAKE_CHECK_CXX_MOVECTOR_DEFAULT_ENABLED
)
If ( CMAKE_CHECK_CXX_MOVECTOR_DEFAULT_ENABLED )
    set(CONFIG_CHECK_CXX_MOVECTOR_DEFAULT_ENABLED   1)
Else  ()
    set(CONFIG_CHECK_CXX_MOVECTOR_DEFAULT_ENABLED   0)
EndIf ()

check_cxx_source_compiles(
   "class Test { public:
        Test(Test &&) = delete;
    };
    int main () { return ( 0 ); }"
    CMAKE_CHECK_CXX_MOVECTOR_DELETE_ENABLED
)
If ( CMAKE_CHECK_CXX_MOVECTOR_DELETE_ENABLED )
    set(CONFIG_CHECK_CXX_MOVECTOR_DELETE_ENABLED    1)
Else  ()
    set(CONFIG_CHECK_CXX_MOVECTOR_DELETE_ENABLED    0)
EndIf ()

##  Check Compiler Accepts 'Move Operator Equal' declare/default/delete.

check_cxx_source_compiles(
   "class Test { public:
        Test & operator = (Test &&) { }
    };
    int main () { return ( 0 ); }"
    CMAKE_CHECK_CXX_MOVEOPEQ_DECLARE_ENABLED
)
If ( CMAKE_CHECK_CXX_MOVEOPEQ_DECLARE_ENABLED )
    set(CONFIG_CHECK_CXX_MOVEOPEQ_DECLARE_ENABLED   1)
Else  ()
    set(CONFIG_CHECK_CXX_MOVEOPEQ_DECLARE_ENABLED   0)
EndIf ()

check_cxx_source_compiles(
   "class Test { public:
        Test & operator = (Test &&) = default;
    };
    int main () { return ( 0 ); }"
    CMAKE_CHECK_CXX_MOVEOPEQ_DEFAULT_ENABLED
)
If ( CMAKE_CHECK_CXX_MOVEOPEQ_DEFAULT_ENABLED )
    set(CONFIG_CHECK_CXX_MOVEOPEQ_DEFAULT_ENABLED   1)
Else  ()
    set(CONFIG_CHECK_CXX_MOVEOPEQ_DEFAULT_ENABLED   0)
EndIf ()

check_cxx_source_compiles(
   "class Test { public:
        Test & operator = (Test &&) = delete;
    };
    int main () { return ( 0 ); }"
    CMAKE_CHECK_CXX_MOVEOPEQ_DELETE_ENABLED
)
If ( CMAKE_CHECK_CXX_MOVEOPEQ_DELETE_ENABLED )
    set(CONFIG_CHECK_CXX_MOVEOPEQ_DELETE_ENABLED    1)
Else  ()
    set(CONFIG_CHECK_CXX_MOVEOPEQ_DELETE_ENABLED    0)
EndIf ()

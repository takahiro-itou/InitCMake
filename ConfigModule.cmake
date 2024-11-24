
##----------------------------------------------------------------
##
##    省略された変数を設定。
##

If ( NOT DEFINED  MODULE_DIR_NAME )
    set(MODULE_DIR_NAME     ${MODULE_TITLE})
EndIf ()

If ( NOT DEFINED  MODULE_OUTPUT_NAME )
    set(MODULE_OUTPUT_NAME  ${MODULE_TITLE})
EndIf()

##----------------------------------------------------------------
##
##    インクルードディレクトリのパスを設定。
##

set(inclib_source_dir   "${incpkg_source_dir}/${MODULE_DIR_NAME}")
set(inclib_binary_dir   "${incpkg_binary_dir}/${MODULE_DIR_NAME}")

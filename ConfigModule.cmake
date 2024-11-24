
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

set(inclib_source_dir   "${INCLUDE_SOURCE_DIR}/${MODULE_DIR_NAME}")
set(inclib_binary_dir   "${INCLUDE_BINARY_DIR}/${MODULE_DIR_NAME}")

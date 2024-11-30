##################################################################
##
##    ライブラリモジュールのビルドとインストールを設定する
##
##    豫め決められた変数を設定して、
##  このファイルをインクルードする。
##
##    インクルードする前に設定すべき変数：
##
##  -   プロジェクト全体で共通にする事が多い変数
##    --  inctop_dir_name
##    --  inctop_source_dir
##    --  LIBRARIES_TARGET_PREFIX
##    --  LIBRARIES_NAME_PREFIX
##    --  libtop_dir_name
##    --  OUTPUT_DEBUG_SUFFIX
##    --  OUTPUT_RELEASE_SUFFIX
##    --  PACKAGE_INCLUDE_DIR
##    --  PROJECT_NAME
##  -   モジュール毎に設定する必要がある変数：
##    --  inclib_header_files
##    --  library_source_files
##    --  module_dir_name
##    --  module_title
##    --  module_output_name
##

##----------------------------------------------------------------
##
##    ターゲットの設定
##

##  ターゲットの名前。

set(module_target_name      "${LIBRARIES_TARGET_PREFIX}${module_title}")

set(project_module_target   "${PROJECT_NAME}-${module_target_name}")
set(module_install_export   "${PROJECT_NAME}-${module_title}-Export")
set(module_build_export     "${PROJECT_NAME}-${module_title}-BuildTree-Export")

##  ソースファイルの有無を確認する。

If ( NOT ( "${library_source_files}" STREQUAL "" ) )
    ##  通常通りライブラリファイルを生成する。
    add_library(${project_module_target}
            ${library_source_files})

    ##  出力するファイル名。
    If ( "${module_output_name}" STREQUAL "" )
        set(LIBRARY_OUTPUT_NAME
                ${LIBRARIES_NAME_PREFIX}${module_target_name}
        )
    Else  ()
        set(LIBRARY_OUTPUT_NAME
                ${LIBRARIES_NAME_PREFIX}${module_output_name}
        )
    EndIf ()

    set_property(TARGET     ${project_module_target}
            PROPERTY        OUTPUT_NAME
            ${LIBRARY_OUTPUT_NAME}
    )
    set_property(TARGET     ${project_module_target}
            PROPERTY        OUTPUT_NAME_DEBUG
            ${LIBRARY_OUTPUT_NAME}${OUTPUT_DEBUG_SUFFIX}
    )
    set_property(TARGET     ${project_module_target}
            PROPERTY        OUTPUT_NAME_RELEASE
            ${LIBRARY_OUTPUT_NAME}${OUTPUT_RELEASE_SUFFIX}
    )

Else  ()
    ##  ヘッダのみのインターフェイスライブラリ。
    add_library(${project_module_target}    INTERFACE)
EndIf ()

##----------------------------------------------------------------
##
##    ターゲットが必要とするライブラリがあれば設定する。
##

If ( NOT ( "${MODULE_NEEDS_LIBRARIES}" STREQUAL "" ) )
    target_link_libraries(
            ${project_module_target}
            ${MODULE_NEEDS_LIBRARIES}
    )
EndIf ()

##----------------------------------------------------------------
##
##    インクルードディレクトリを設定する。
##

set_property(TARGET     ${project_module_target}
        APPEND  PROPERTY   INTERFACE_INCLUDE_DIRECTORIES
        $<BUILD_INTERFACE:${inctop_source_dir}>
        $<INSTALL_INTERFACE:${inctop_dir_name}>
)

##----------------------------------------------------------------
##
##    ファイルのインストール。
##


##  ヘッダファイルをインストールする。

install(FILES           ${inclib_header_files}
        DESTINATION     ${PACKAGE_INCLUDE_DIR}/${module_dir_name}
)

##  ライブラリファイルをインストールする。

install(TARGETS     ${project_module_target}
        EXPORT      ${module_install_export}
        ARCHIVE     DESTINATION  ${libtop_dir_name}/${module_dir_name}
        LIBRARY     DESTINATION  ${libtop_dir_name}/${module_dir_name}
)

##----------------------------------------------------------------
##
##    エクスポート設定。
##

##  インストールツリー向けのエクスポート。

install(EXPORT          ${module_install_export}
        FILE            ${module_install_export}.cmake
        DESTINATION     ${libtop_dir_name}/${module_dir_name}
        EXPORT_LINK_INTERFACE_LIBRARIES
)

##  ビルドツリー向けのエクスポート。

export(
    TARGETS     ${project_module_target}
    FILE        ${module_build_export}.cmake
)

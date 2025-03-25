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
##    --  libraries_target_prefix
##    --  libraries_name_prefix
##    --  libtop_dir_name
##    --  output_debug_suffix
##    --  output_release_suffix
##    --  package_includedir
##    --  project_name
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

##  ソースファイルの有無を確認する。

If ( NOT ( "${library_source_files}" STREQUAL "" ) )
    ##  通常通りライブラリファイルを生成する。
    add_library(${project_module_target}
            ${library_source_files})

    ##  出力するファイル名。
    If ( "${module_output_name}" STREQUAL "" )
        set(library_output_name
                ${libraries_name_prefix}${module_title}
        )
    Else  ()
        set(library_output_name
                ${libraries_name_prefix}${module_output_name}
        )
    EndIf ()

    set_property(TARGET     ${project_module_target}
            PROPERTY        OUTPUT_NAME
            ${library_output_name}
    )
    set_property(TARGET     ${project_module_target}
            PROPERTY        OUTPUT_NAME_DEBUG
            ${library_output_name}${output_debug_suffix}
    )
    set_property(TARGET     ${project_module_target}
            PROPERTY        OUTPUT_NAME_RELEASE
            ${library_output_name}${output_release_suffix}
    )

Else  ()
    ##  ヘッダのみのインターフェイスライブラリ。
    add_library(${project_module_target}    INTERFACE)
EndIf ()

##----------------------------------------------------------------
##
##    ターゲットが必要とするライブラリがあれば設定する。
##

If ( NOT ( "${module_needs_libraries}" STREQUAL "" ) )
    target_link_libraries(
            ${project_module_target}
            ${module_needs_libraries}
    )
EndIf ()


##----------------------------------------------------------------
##
##    インクルードディレクトリを設定する。
##

If ( NOT ( "${library_source_files}" STREQUAL "" ) )
    target_include_directories(
            ${project_module_target}  PUBLIC
            $<BUILD_INTERFACE:${inctop_source_dir}>
            $<INSTALL_INTERFACE:${inctop_dir_name}>
    )

    target_include_directories(
            ${project_module_target}  PUBLIC
            $<BUILD_INTERFACE:${inctop_binary_dir}>
    )
Else ()
    target_include_directories(
            ${project_module_target}  INTERFACE
            $<BUILD_INTERFACE:${inctop_source_dir}>
            $<INSTALL_INTERFACE:${inctop_dir_name}>
    )

    target_include_directories(
            ${project_module_target}  INTERFACE
            $<BUILD_INTERFACE:${inctop_binary_dir}>
    )
EndIf ()


##----------------------------------------------------------------
##
##    ファイルのインストール。
##


##  ヘッダファイルをインストールする。

install(FILES           ${inclib_header_files}
        DESTINATION     ${package_includedir}/${module_dir_name}
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

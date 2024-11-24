
##----------------------------------------------------------------
##
##    ディレクトリ名。
##

set(incpkg_dir_name         "${PROJECT_NAME}")
set(PACKAGE_INCLUDE_DIR     "${inctop_dir_name}/${incpkg_dir_name}")

set(inctop_source_dir       "${PROJECT_SOURCE_DIR}/${inctop_dir_name}")
set(inctop_binary_dir       "${PROJECT_BINARY_DIR}/${inctop_dir_name}")
set(libtop_source_dir       "${PROJECT_SOURCE_DIR}/${libtop_dir_name}")
set(libtop_binary_dir       "${PROJECT_BINARY_DIR}/${libtop_dir_name}")

set(INCLUDE_SOURCE_DIR      "${inctop_source_dir}/${incpkg_dir_name}")
set(INCLUDE_BINARY_DIR      "${inctop_binary_dir}/${incpkg_dir_name}")


##----------------------------------------------------------------
##
##    インクルードパスの設定。
##

include_directories("${inctop_source_dir}")
include_directories("${inctop_binary_dir}")

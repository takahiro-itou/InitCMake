
##----------------------------------------------------------------
##
##    ディレクトリ名。
##

set(INCPKG_DIR_NAME         "${PROJECT_NAME}")
set(PACKAGE_INCLUDE_DIR     "${inctop_dir_name}/${INCPKG_DIR_NAME}")

set(INCTOP_SOURCE_DIR       "${PROJECT_SOURCE_DIR}/${inctop_dir_name}")
set(INCTOP_BINARY_DIR       "${PROJECT_BINARY_DIR}/${inctop_dir_name}")
set(LIBTOP_SOURCE_DIR       "${PROJECT_SOURCE_DIR}/${libtop_dir_name}")
set(LIBTOP_BINARY_DIR       "${PROJECT_BINARY_DIR}/${libtop_dir_name}")

set(INCLUDE_SOURCE_DIR      "${INCTOP_SOURCE_DIR}/${INCPKG_DIR_NAME}")
set(INCLUDE_BINARY_DIR      "${INCTOP_BINARY_DIR}/${INCPKG_DIR_NAME}")


##----------------------------------------------------------------
##
##    インクルードパスの設定。
##

include_directories("${INCTOP_SOURCE_DIR}")
include_directories("${INCTOP_BINARY_DIR}")

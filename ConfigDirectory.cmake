
##----------------------------------------------------------------
##
##    ディレクトリ名。
##

set(incpkg_dir_name         "${PROJECT_NAME}")
set(PACKAGE_INCLUDE_DIR     "${inctop_dir_name}/${incpkg_dir_name}")

set(INCTOP_SOURCE_DIR       "${PROJECT_SOURCE_DIR}/${inctop_dir_name}")
set(INCTOP_BINARY_DIR       "${PROJECT_BINARY_DIR}/${inctop_dir_name}")
set(LIBTOP_SOURCE_DIR       "${PROJECT_SOURCE_DIR}/${libtop_dir_name}")
set(LIBTOP_BINARY_DIR       "${PROJECT_BINARY_DIR}/${libtop_dir_name}")

set(INCLUDE_SOURCE_DIR      "${INCTOP_SOURCE_DIR}/${incpkg_dir_name}")
set(INCLUDE_BINARY_DIR      "${INCTOP_BINARY_DIR}/${incpkg_dir_name}")


##----------------------------------------------------------------
##
##    インクルードパスの設定。
##

include_directories("${INCTOP_SOURCE_DIR}")
include_directories("${INCTOP_BINARY_DIR}")

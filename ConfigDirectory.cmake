
##----------------------------------------------------------------
##
##    ディレクトリ名。
##

set(INCPKG_DIR_NAME         "${PROJECT_NAME}")
set(PACKAGE_INCLUDE_DIR     "${INCTOP_DIR_NAME}/${INCPKG_DIR_NAME}")

set(INCTOP_SOURCE_DIR       "${PROJECT_SOURCE_DIR}/${INCTOP_DIR_NAME}")
set(INCTOP_BINARY_DIR       "${PROJECT_BINARY_DIR}/${INCTOP_DIR_NAME}")
set(LIBTOP_SOURCE_DIR       "${PROJECT_SOURCE_DIR}/${LIBTOP_DIR_NAME}")
set(LIBTOP_BINARY_DIR       "${PROJECT_BINARY_DIR}/${LIBTOP_DIR_NAME}")

set(INCLUDE_SOURCE_DIR      "${INCTOP_SOURCE_DIR}/${INCPKG_DIR_NAME}")
set(INCLUDE_BINARY_DIR      "${INCTOP_BINARY_DIR}/${INCPKG_DIR_NAME}")


##----------------------------------------------------------------
##
##    インクルードパスの設定。
##

include_directories("${PROJECT_SOURCE_DIR}/${INCTOP_DIR_NAME}")
include_directories("${PROJECT_BINARY_DIR}/${INCTOP_DIR_NAME}")


##----------------------------------------------------------------
##
##    ディレクトリ名。
##

set(incpkg_dir_name         "${project_name}")
set(package_includedir      "${inctop_dir_name}/${incpkg_dir_name}")

set(inctop_source_dir       "${PROJECT_SOURCE_DIR}/${inctop_dir_name}")
set(inctop_binary_dir       "${PROJECT_BINARY_DIR}/${inctop_dir_name}")
set(libtop_source_dir       "${PROJECT_SOURCE_DIR}/${libtop_dir_name}")
set(libtop_binary_dir       "${PROJECT_BINARY_DIR}/${libtop_dir_name}")

set(incpkg_source_dir       "${inctop_source_dir}/${incpkg_dir_name}")
set(incpkg_binary_dir       "${inctop_binary_dir}/${incpkg_dir_name}")


##----------------------------------------------------------------
##
##    インクルードパスの設定。
##

##  各ターゲットに対し target_include_directories で
##  設定するように修正したので、
##  ここでは特に設定する項目は無い。

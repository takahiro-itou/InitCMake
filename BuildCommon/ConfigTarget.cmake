
##----------------------------------------------------------------
##
##    プロジェクト内のターゲットの参照
##

##  ターゲットのプレフィックス。

set(project_target_prefix   "${project_name}-${libraries_target_prefix}")
set(project_export_prefix   "${project_name}-")

##  ターゲットの名前。

set(project_module_target   "${project_target_prefix}${module_title}")
set(module_export_prefix    "${project_export_prefix}${module_title}")
set(module_install_export   "${module_export_prefix}-Export")
set(module_build_export     "${module_export_prefix}-BuildTree-Export")

message("Current Source Dir : ${CMAKE_CURRENT_SOURCE_DIR}")
message("Config Target for ${module_title}")
message("  project_module_target = ${project_module_target}")
message("  module_export_prefix  = ${module_export_prefix}")
message("  module_install_export = ${module_install_export}")

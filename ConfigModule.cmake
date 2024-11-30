
##----------------------------------------------------------------
##
##    省略された変数を設定。
##

If ( NOT DEFINED  module_dir_name )
    set(module_dir_name     ${module_title})
EndIf ()

If ( NOT DEFINED  module_output_name )
    set(module_output_name  ${module_title})
EndIf()


##----------------------------------------------------------------
##
##    プロジェクト内のターゲットの参照
##

Include (${common_cmake_dir}/ConfigTarget.cmake)


##----------------------------------------------------------------
##
##    インクルードディレクトリのパスを設定。
##

set(inclib_source_dir   "${incpkg_source_dir}/${module_dir_name}")
set(inclib_binary_dir   "${incpkg_binary_dir}/${module_dir_name}")

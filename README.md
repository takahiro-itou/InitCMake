#   使い方

##  このリポジトリをサブモジュールに追加

- このリポジトリの内容を使いたいリポジトリの作業ディレクトリに移動
- サブモジュールに追加する

```
cd /path/to/your_repo
git submodule add https://gitlab.com/takahiro-itou/InitCMake.git [path_for_cmake]
```

##  CMakeLists.txt  を編集

```
##
##    共通の .cmake ファイルの置いてある場所。
##

set(common_cmake_dir        "${PROJECT_SOURCE_DIR}/[path_for_cmake]")
```

###   コンパイラの持つ機能を検査

```
##----------------------------------------------------------------
##
##    ビルド環境の検査。
##

Include (${common_cmake_dir}/Checks/EnableCxx11.cmake)

Include (${common_cmake_dir}/Checks/ConstExpr.cmake)
Include (${common_cmake_dir}/Checks/NullPtr.cmake)
Include (${common_cmake_dir}/Checks/Override.cmake)
```

|        ファイル名        |          設定されるフラグ          |  検査対象  |
|:-------------------------|:-----------------------------------|:-----------|
| EnableCxx11.cmake        | cxxflags_enable_stdcxx, CXXFLAGS   | 下記参照   |
| ConstExpr.cmake          | CONFIG_CHECK_CXX_CONSTEXPR_ENABLED | constexpr  |
| NullPtr.cmake            | CONFIG_CHECK_CXX_NULLPTR_ENABLED   | nullptr    |
| Override.cmake           | CONFIG_CHECK_CXX_OVERRIDE_ENABLED  | override   |

- EnableCxx11.cmake の判定結果

| 検査順序 |         フラグ名         |   検査対象   |
|---------:|:-------------------------|:-------------|
|       1  | compiler_accepts_gnuxx14 | --std=gnu+14 |
|       2  | compiler_accepts_gnuxx11 | --std=gnu+11 |
|       3  | compiler_accepts_cxx11   | --std=c++11  |
|       4  | compiler_accepts_cxx0x   | --std=c++0x  |

これを上から順に検査して、最初に受け入れられたオプションが
変数 cxxflags_enable_stdcxx に設定され、
さらに変数 CMAKE_CXX_FLAGS  の末尾に追記される。

###   外部パッケージの追加

```
##----------------------------------------------------------------
##
##    Additional Packages.
##    外部ライブラリ。
##

set(CMAKE_MODULE_PATH
    ${CMAKE_MODULE_PATH}  ${common_cmake_dir}/Packages
)

Find_Package (CppUnit)
```

- これでターゲット TestDriver::CppUnit が定義される。
- 以下のようにこのターゲットを使うと、
  必要なオプションがコンパイラやリンカに渡される。

```
set(test_driver_module  "TestDriver")
target_link_libraries(${test_driver_module}     TestDriver::CppUnit)
```

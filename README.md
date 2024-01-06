#   使い方

##  このリポジトリをサブモジュールに追加

- このリポジトリの内容を使いたいリポジトリの作業ディレクトリに移動
- サブモジュールに追加する

```
cd /path/to/your_repo
git submodule add https://gitlab.com/takahiro-itou/InitCMake.git [path_for_cmake]
```

##  CMakeLists.txt  を編集

###   コンパイラの持つ機能を検査

```
##----------------------------------------------------------------
##
##    ビルド環境の検査。
##

Include (${COMMON_CMAKE_DIR}/EnableCxx11.cmake)

Include (${COMMON_CMAKE_DIR}/CheckConstExpr.cmake)
Include (${COMMON_CMAKE_DIR}/CheckNullPtr.cmake)
Include (${COMMON_CMAKE_DIR}/CheckOverride.cmake)
```

|      ファイル名      |          設定されるフラグ          |  検査対象  |
|:---------------------|:-----------------------------------|:-----------|
| EnableCxx11.cmake    | CXXFLAGS_ENABLE_STDCXX, CXXFLAGS   | 下記参照   |
| CheckConstExpr.cmake | CONFIG_CHECK_CXX_CONSTEXPR_ENABLED | constexpr  |
| CheckNullPtr.cmake   | CONFIG_CHECK_CXX_NULLPTR_ENABLED   | nullptr    |
| CheckOverride.cmake  | CONFIG_CHECK_CXX_OVERRIDE_ENABLED  | override   |


###   外部パッケージの追加

```
##----------------------------------------------------------------
##
##    Additional Packages.
##    外部ライブラリ。
##

set(CMAKE_MODULE_PATH
    ${CMAKE_MODULE_PATH}  ${COMMON_CMAKE_DIR}/Modules
)

Find_Package (CppUnit)
```

- これでターゲット CPPUNIT::CPPUNIT が定義される。
- 以下のようにこのターゲットを使うと、
  必要なオプションがコンパイラやリンカに渡される。

```
set(TEST_DRIVER_MODULE  "TestDriver")
target_link_libraries(${TEST_DRIVER_MODULE}     CPPUNIT::CPPUNIT)
```

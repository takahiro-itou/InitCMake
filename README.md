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

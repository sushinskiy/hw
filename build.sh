BUILD_DIR=$PWD/build

cmake -S . -G "Unix Makefiles" -B $BUILD_DIR -DDLIB_EXT=".so" -DCMAKE_PREFIX_PATH=$BUILD_PREFIX
cmake --build $BUILD_DIR --config Release
cmake --install $BUILD_DIR --prefix "$PREFIX/output_bin"

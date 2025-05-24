SET BUILD_DIR=%CD%/build64

cmake -S . -G "Visual Studio 17 2022" -B %BUILD_DIR% -A x64
cmake --build %BUILD_DIR% --config Release 
cmake --install %BUILD_DIR% --prefix "%PREFIX%\output_bin"

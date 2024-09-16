@echo off
set VCPKG_DIR=D:\vcpkg
set DEP_DIR=%CD%\dependencies
set DEBUG_DIR=%CD%\Debug
if not exist "%DEP_DIR%" mkdir "%DEP_DIR%"
if not exist "%DEP_DIR%\include" mkdir "%DEP_DIR%\include"
if not exist "%DEP_DIR%\lib" mkdir "%DEP_DIR%\lib"
if not exist "%DEBUG_DIR%" mkdir "%DEBUG_DIR%"
xcopy "%VCPKG_DIR%\installed\x64-windows\include\tesseract" "%DEP_DIR%\include\tesseract" /E /I /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\lib\tesseract54d.lib" "%DEP_DIR%\lib" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\include\leptonica" "%DEP_DIR%\include\leptonica" /E /I /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\lib\leptonica-1.84.1d.lib" "%DEP_DIR%\lib" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\archive.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\bz2d.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\gif.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\jpeg62.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\leptonica-1.84.1d.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\libcurl-d.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\liblzma.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\libpng16d.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\libsharpyuv.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\libwebp.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\libwebpdemux.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\libwebpmux.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\lz4d.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\openjp2.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\tesseract54d.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\tiffd.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\zstd.dll" "%DEBUG_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\debug\bin\zlibd1.dll" "%DEBUG_DIR%" /Y
echo Debug dependencies copied to Debug folder.
pause

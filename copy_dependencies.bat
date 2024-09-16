@echo off
set VCPKG_DIR=D:\vcpkg
set DEP_DIR=%CD%\dependencies
set RELEASE_DIR=%CD%\Release

if not exist "%DEP_DIR%" mkdir "%DEP_DIR%"
if not exist "%DEP_DIR%\include" mkdir "%DEP_DIR%\include"
if not exist "%DEP_DIR%\lib" mkdir "%DEP_DIR%\lib"
if not exist "%RELEASE_DIR%" mkdir "%RELEASE_DIR%"

xcopy "%VCPKG_DIR%\installed\x64-windows\include\tesseract" "%DEP_DIR%\include\tesseract" /E /I /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\lib\tesseract54.lib" "%DEP_DIR%\lib" /Y

xcopy "%VCPKG_DIR%\installed\x64-windows\include\leptonica" "%DEP_DIR%\include\leptonica" /E /I /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\lib\leptonica-1.84.1.lib" "%DEP_DIR%\lib" /Y

xcopy "%VCPKG_DIR%\installed\x64-windows\bin\archive.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\bz2.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\gif.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\jpeg62.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\leptonica-1.84.1.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\libcurl.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\liblzma.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\libpng16.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\libsharpyuv.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\libwebp.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\libwebpdemux.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\libwebpmux.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\lz4.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\openjp2.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\tesseract54.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\tiff.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\zstd.dll" "%RELEASE_DIR%" /Y
xcopy "%VCPKG_DIR%\installed\x64-windows\bin\zlib1.dll" "%RELEASE_DIR%" /Y

echo Dependencies copied to Release folder.
pause

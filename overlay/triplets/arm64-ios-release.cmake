set(VCPKG_TARGET_ARCHITECTURE arm64)
set(VCPKG_CRT_LINKAGE dynamic)
# iOS apps link everything statically into the app binary
set(VCPKG_LIBRARY_LINKAGE static)
set(VCPKG_CMAKE_SYSTEM_NAME iOS)
set(VCPKG_OSX_DEPLOYMENT_TARGET 14.0)
# Device only: without it, Qt on an Intel host builds device + x86_64
# simulator, and its configure tests fail to link the device-only libresolv
set(VCPKG_OSX_ARCHITECTURES arm64)
set(VCPKG_BUILD_TYPE release)
# djsugar sets the Basic Quick Controls style (Fusion for dialogs); every
# other built style is unused weight in the package.
set(VCPKG_CMAKE_CONFIGURE_OPTIONS ${VCPKG_CMAKE_CONFIGURE_OPTIONS}
    -DFEATURE_quickcontrols2_material=OFF
    -DFEATURE_quickcontrols2_universal=OFF
    -DFEATURE_quickcontrols2_imagine=OFF
    -DFEATURE_quickcontrols2_fluentwinui3=OFF)
# vcpkg_check_features turns FEATURE_opengl OFF unless the desktop "opengl"
# feature is requested; on iOS the GLES2 build still needs the QtOpenGL module.
if(PORT STREQUAL "qtbase")
    set(VCPKG_CMAKE_CONFIGURE_OPTIONS ${VCPKG_CMAKE_CONFIGURE_OPTIONS} -DFEATURE_opengl=ON)
endif()
# lame 3.100's config.sub predates aarch64-apple-ios; arm-apple-darwin is a
# host name it knows. Compiler flags (-arch arm64, iPhoneOS SDK) are unchanged.
if(PORT STREQUAL "mp3lame")
    set(VCPKG_MAKE_BUILD_TRIPLET "--host=arm-apple-darwin")
endif()

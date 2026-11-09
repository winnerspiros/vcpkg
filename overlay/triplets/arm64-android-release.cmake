set(VCPKG_TARGET_ARCHITECTURE arm64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE static)
set(VCPKG_CMAKE_SYSTEM_NAME Android)
set(VCPKG_CMAKE_SYSTEM_VERSION 35)
set(ANDROID_SDK_ROOT /usr/lib/android-sdk/)
set(ANDROID_API_VERSION 35)
set(VCPKG_MAKE_BUILD_TRIPLET "--host=aarch64-linux-android")
set(VCPKG_CMAKE_CONFIGURE_OPTIONS -DANDROID_ABI=arm64-v8a -DCMAKE_ANDROID_NDK=$ENV{ANDROID_NDK_HOME}
    # djsugar uses the Basic style (and Fusion for dialogs). androiddeployqt
    # bundles every built style: these are ~12 MB of unused libraries.
    -DFEATURE_quickcontrols2_material=OFF
    -DFEATURE_quickcontrols2_universal=OFF
    -DFEATURE_quickcontrols2_imagine=OFF
    -DFEATURE_quickcontrols2_fluentwinui3=OFF)
set(VCPKG_BUILD_TYPE release)
# The NDK toolchain already adds -ffunction-sections/-fdata-sections, but also
# -g on every compile. djsugar strips the APK anyway, so drop debug info: much
# faster compiles/links and a buildenv that fits a GitHub release (< 2 GiB).
set(VCPKG_C_FLAGS "-g0")
set(VCPKG_CXX_FLAGS "-g0")

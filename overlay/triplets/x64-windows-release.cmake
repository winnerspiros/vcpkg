set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_BUILD_TYPE release)
# djsugar sets the Basic Quick Controls style (Fusion for dialogs); every
# other built style is unused weight in the package.
set(VCPKG_CMAKE_CONFIGURE_OPTIONS ${VCPKG_CMAKE_CONFIGURE_OPTIONS}
    -DFEATURE_quickcontrols2_material=OFF
    -DFEATURE_quickcontrols2_universal=OFF
    -DFEATURE_quickcontrols2_imagine=OFF
    -DFEATURE_quickcontrols2_fluentwinui3=OFF)

set(VCPKG_TARGET_ARCHITECTURE arm64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE static)

set(VCPKG_CMAKE_SYSTEM_NAME Linux)
set(VCPKG_BUILD_TYPE release)

# glib must be shared to avoid a constructor ordering crash when
# statically linked alongside FFmpeg via LINK_GROUP:RESCAN.
# fontconfig, freetype, harfbuzz, alsa and jack2 must be shared too,
# because the AppImage build delegates them to the host system.
if(PORT MATCHES "^(glib|fontconfig|freetype|harfbuzz|alsa|jack2)$")
    set(VCPKG_LIBRARY_LINKAGE dynamic)
endif()


# djsugar sets the Basic Quick Controls style (Fusion for dialogs); every
# other built style is unused weight in the package.
set(VCPKG_CMAKE_CONFIGURE_OPTIONS ${VCPKG_CMAKE_CONFIGURE_OPTIONS}
    -DFEATURE_quickcontrols2_material=OFF
    -DFEATURE_quickcontrols2_universal=OFF
    -DFEATURE_quickcontrols2_imagine=OFF
    -DFEATURE_quickcontrols2_fluentwinui3=OFF)

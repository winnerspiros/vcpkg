vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO taglib/taglib
    REF 58499cb157c38b8d07b262b15c4ecba9f36aeb9a # main 2026-11-11: parser hardening after 2.3.2
    SHA512 4d69abc88a97eb4adba10809d0f582b53b789ca1aa2bdd2d426373148f9f7db7693ca6bd0a979dc188a7dc63c325475c31ccafdf415de738587df4e62d110e00
    HEAD_REF master
    PATCHES
        remove-bin-files.patch
        taglib-config.patch
        taglib-static.patch
)

if(VCPKG_CMAKE_SYSTEM_NAME STREQUAL "WindowsStore")
    set(WINRT_OPTIONS -DHAVE_VSNPRINTF=1 -DPLATFORM_WINRT=1)
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTING=OFF
        -DBUILD_EXAMPLES=OFF
        ${WINRT_OPTIONS}
)
vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/taglib)
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

vcpkg_install_copyright(
    FILE_LIST
        "${SOURCE_PATH}/COPYING.LGPL"
        "${SOURCE_PATH}/COPYING.MPL"
)

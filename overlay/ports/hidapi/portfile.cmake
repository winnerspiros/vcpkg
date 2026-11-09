vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO libusb/hidapi
    REF e4c4a08b08e2ec55a10bb28a5628c5b886c6eb63 # master 2026-11-08: libusb fixes incl. #728 (large reports)
    SHA512 63abc1ea62a866ff282e36fb9c33cf96b638fa01f40cfc894fab5664c5a6893ccadfcd9d038110beb3acc32bc9370d7c6a5afab47614e71a1b98bac7ab68ddcf
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
FEATURES
    "pp-data-dump"           HIDAPI_BUILD_PP_DATA_DUMP
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DHIDAPI_BUILD_HIDTEST=OFF
        -DHIDAPI_WITH_TESTS=OFF
        ${FEATURE_OPTIONS}
    MAYBE_UNUSED_VARIABLES
        # Windows only
        HIDAPI_BUILD_PP_DATA_DUMP
        HIDAPI_WITH_TESTS
)
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})
vcpkg_fixup_pkgconfig()
vcpkg_copy_pdbs()

if ("pp-data-dump" IN_LIST FEATURES)
    vcpkg_copy_tools(TOOL_NAMES pp_data_dump AUTO_CLEAN)
endif()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE-bsd.txt")

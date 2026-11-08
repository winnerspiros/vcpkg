vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO google/oboe
    REF 8c13e5e2552bdf9ccadb4211a48646e32b50eabd # google/oboe main (1.11.1)
    SHA512 235351c2fa626dd2ee00d678920526643e16c7c32e20d0bb091b8664afd0a9a6730c5b535a9fe41e2687fb538760f21086d508568e76ff3fdadb0569b3025fff
    HEAD_REF main
    PATCHES
        fix_install.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

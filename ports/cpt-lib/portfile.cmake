vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO PurpurTentakel97/cpt-lib
        REF "v${VERSION}"
        SHA512 2f096245f09772f6c45c44860d3fba2b3014bba608773c1a9ab125b9a661f63210c18ba4090c5c06e6230e6fae1aeb211052823c4a6a806a4bbe71c1ad7478b1
        HEAD_REF main
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
        "-Dcpt_lib_tests=OFF"
)
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

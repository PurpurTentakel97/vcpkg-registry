vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO PurpurTentakel97/cpt-lib
        REF "v${VERSION}"
        SHA512 028b522e51eb3c70e45bc27fb187e97ce9ce3466dcd9e5557f3766ba7708e6b5a341d4e9a036f5f4d8fb8fba56064ece2540ff0b0de6d8c72d7283f288017569
        HEAD_REF main
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
        "-Dcpt_lib_warnings_as_errors=OFF"
        "-Dcpt_lib_enable_undefined_behavior_sanitizer=OFF"
        "-Dcpt_lib_enable_address_sanitizer=OFF"
        "-Dcpt_lib_tests=OFF"
)
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

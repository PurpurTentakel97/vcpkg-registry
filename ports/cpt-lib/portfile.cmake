vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO PurpurTentakel97/cpt-lib
        REF "v${VERSION}"
        SHA512 c61605301fb21a889eda4801430896f4737b4434f54fbcb90ea5cdd20222f30583176db4b138a30bb8ec9f98153f3ea1bc01e0fcf356815d5ef2e24ee1b7de0a
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

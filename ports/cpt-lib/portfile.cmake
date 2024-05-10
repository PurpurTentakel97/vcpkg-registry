vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO PurpurTentakel97/cpt-lib
        REF "v${VERSION}"
        SHA512 63267125809a63c360b01064a9df8705bee9df6508de1ea640cf8b446b6dfc8f51ff232ae5ae78c109165bcef814dd21bf14786b192f0d09ee3f9092bb18e7bd
        HEAD_REF main
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO PurpurTentakel97/cpt-lib
        REF "v${VERSION}"
        SHA512 613b8c1ab09614b2231c9209788be6f1e699d7147cf7fa98c600e978ae6efa9ecd3f47523c777f1590d11f22085d9a1da95f23d7aa7c8a97855159c1e519596c
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

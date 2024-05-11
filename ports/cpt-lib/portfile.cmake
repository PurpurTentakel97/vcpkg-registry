vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO PurpurTentakel97/cpt-lib
        REF "v${VERSION}"
        SHA512 b6c939f552f05f0d932ff58c12306e688ce845cac281ea39cfce1460a9d4ec068b6a9a377b92bcdbf374203c876824db847389372229bd9704c7aa7c2974df2a
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

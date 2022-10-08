# Test comment
vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO WesleyDucharme/nerdfont-codepoints
  REF 43c9dde6e5b0b492459565d91c2b2bbcd0dbb0b1
  SHA512 0
  HEAD_REF main
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
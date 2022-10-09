# REF: This is the commit hash found by looking at the commit on github
# SHA512: This is the hash of the tarball file for the repo at the given commit.
#         Download the tarball: https://github.com/<org>/<repo>/tarball/<commithash>
#         Hash it using vcpkg: vcpkg.exe hash <path_to_tarball>
# I should write some scripts to make a lot of this easier.
# The git tree property for a version file is based `git rev-parse HEAD:ports/nerdfont-codepoints`
vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO WesleyDucharme/nerdfont-codepoints
  REF 447c118ca9c44df8e8d3a4177921b86f65443f83
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
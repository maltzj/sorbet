load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")

# We define our externals here instead of directly in WORKSPACE
# because putting the `new_git_repository` calls here instead of there
# works around https://github.com/bazelbuild/bazel/issues/1465 when
# passing `build_file` to the `new_git_repository`.
def externals():
    native.new_http_archive(
        name = "gtest",
        url = "https://github.com/google/googletest/archive/release-1.8.0.zip",
        sha256 = "f3ed3b58511efd272eb074a3a6d6fb79d7c2e6a0e374323d1e6bcbcc1ef141bf",
        build_file = "//third_party:gtest.BUILD",
        strip_prefix = "googletest-release-1.8.0",
    )

    native.new_http_archive(
        name = "yaml_cpp",
        url = "https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-0.6.2.zip",
        sha256 = "292c8de66bfda19a2ca08a32a8c1ec39b709ac75f54e6be0735940db2dbdff76",
        build_file = "//third_party:yaml_cpp.BUILD",
        strip_prefix = "yaml-cpp-yaml-cpp-0.6.2",
    )

    # their zip archive has symlinks that bazel does not like
    new_git_repository(
        name="spdlog",
        remote="https://github.com/gabime/spdlog.git",
        commit="f4c5c5a36755685028c8148b456a4d7909e3d7dd", # v0.17.0
        build_file = "//third_party:spdlog.BUILD",
    )

    # their zip archive has symlinks that bazel does not like
    new_git_repository(
            name="skarupke_maps",
            remote="https://github.com/skarupke/flat_hash_map.git",
            commit="2c4687431f978f02a3780e24b8b701d22aa32d9c",
            build_file = "//third_party:skarupke_maps.BUILD",
    )

    # proto_library, cc_proto_library, and java_proto_library rules implicitly
    # depend on @com_google_protobuf for protoc and proto runtimes.
    # This statement defines the @com_google_protobuf repo.
    native.http_archive(
        name = "com_google_protobuf",
        sha256 = "d7a221b3d4fb4f05b7473795ccea9e05dab3b8721f6286a95fffbffc2d926f8b",
        strip_prefix = "protobuf-3.6.1",
        urls = ["https://github.com/google/protobuf/archive/v3.6.1.zip"],
    )

    new_git_repository(
        name="lmdb",
        remote="https://github.com/LMDB/lmdb.git",
        commit="26c7df88e44e31623d0802a564f24781acdefde3",
        build_file = "//third_party:lmdb.BUILD",
    )


    new_git_repository(
        name="rapidjson",
        remote="https://github.com/Tencent/rapidjson.git",
        commit="67fac85e96220f69076121d569abd15471abb6bf",
        build_file = "//third_party:rapidjson.BUILD",
    )

    new_git_repository(
        name="lizard",
        remote="https://github.com/inikep/lizard.git",
        commit="6a1ed71450148c8aed57de3179b1bdd81800bada",
        build_file = "//third_party:lizard.BUILD",
    )

    new_git_repository(
        name="jemalloc",
        remote="https://github.com/jemalloc/jemalloc.git",
        commit="0ff7ff3ec7b322881fff3bd6d4861fda6e9331d9", # 5.1.0 with some tunning patches
        build_file = "//third_party:jemalloc.BUILD",
    )

    native.new_local_repository(
        name="progressbar",
        path="third_party/progressbar",
        build_file="//third_party:progressbar.BUILD",
     )

    new_git_repository(
        name="concurrentqueue",
        remote="https://github.com/cameron314/concurrentqueue.git",
        commit="8f65a8734d77c3cc00d74c0532efca872931d3ce",
        build_file = "//third_party:concurrentqueue.BUILD",
    )

    new_git_repository(
        name="statsd",
        remote="https://github.com/romanbsd/statsd-c-client.git",
        commit="0caa5ef05d6a786bb4695394534a7182a3c94427",
        build_file = "//third_party:statsd.BUILD",
    )

    native.new_http_archive(
        name="cxxopts",
        url="https://github.com/jarro2783/cxxopts/archive/v2.1.1.zip",
        sha256="b07a9fbe277247e8e7a9cbfc50af7f56775773efe5082986c215df798c93ee5d",
        build_file = "//third_party:cxxopts.BUILD",
        strip_prefix = "cxxopts-2.1.1",
    )

    native.new_http_archive(
        name="rang",
        url = "https://github.com/agauniyal/rang/archive/v3.1.0.zip",
        sha256="658adeb8a36d36981d4339fc839f2deedc0e75cb421db1982041d8a0a255835d",
        build_file = "//third_party:rang.BUILD",
        strip_prefix = "rang-3.1.0",
    )

    git_repository(
        name="com_google_absl",
        remote="https://github.com/abseil/abseil-cpp.git",
        commit="445998d7ac4e5d3c50411d377e3b50e960d2d6c2"
    )

    new_git_repository(
        name = "compdb",
        commit = "c4cf16f3162c0a13bb8983b3716a979678ae6dc4",
        remote = "https://github.com/grailbio/bazel-compilation-database.git",
        build_file_content = (
        """
package(default_visibility = ["//visibility:public"])
"""
        ),
    )

    native.new_local_repository(
        name="parser",
        path="third_party/parser",
        build_file="//third_party:parser.BUILD",
    )

    git_repository(
        name = "com_grail_bazel_toolchain",
        remote = "https://github.com/DarkDimius/bazel-toolchain.git",
        commit="d11b0ecfee53387564be08172c8d7ce2199e06ee",
    )

    git_repository(
        name = "io_bazel_rules_go",
        remote = "https://github.com/bazelbuild/rules_go.git",
        commit = "cbc1e32fba771845305f15e341fa26595d4a136d",
    )

    git_repository(
        name = "com_github_bazelbuild_buildtools",
        commit = "8a1359dc25add12a6e724f6a2bded60fbc23d08a",
        remote = "https://github.com/bazelbuild/buildifier.git",
    )

    new_git_repository(
        name = "com_github_blake2_libb2",
        commit = "7feb2bb35dfe89750fba62bcd909409e995af754",
        remote ="https://github.com/BLAKE2/libb2",
        build_file = "//third_party:libb2.BUILD",
    )

    new_git_repository(
        name = "com_github_msgpack_msgpack",
        commit = "db54c78ed46e469ac86d57e168aa7bcdb4094749",
        remote = "https://github.com/msgpack/msgpack-c",
        build_file = "//third_party:msgpack.BUILD",
    )

    new_git_repository(
        name = "com_github_d_bahr_crcpp",
        commit = "76dc872e163ea91ca51468db686ba16912979765",
        remote = "https://github.com/d-bahr/CRCpp.git",
        build_file = "//third_party:crcpp.BUILD",
    )

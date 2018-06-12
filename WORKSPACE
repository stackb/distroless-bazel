workspace(name = "com_github_stackb_distoless_bazel")

load("//:deps.bzl", "distroless_bazel_repositories", "bazel_dependencies")
distroless_bazel_repositories()

load("@io_bazel_rules_go//go:def.bzl", "go_rules_dependencies", "go_register_toolchains")
go_rules_dependencies()
go_register_toolchains(go_version = "1.9")

load("//:debian.bzl", "debian_dependencies")
debian_dependencies()

load("//:container.bzl", "container_dependencies")
container_dependencies()

bazel_dependencies()



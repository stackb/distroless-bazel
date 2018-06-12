RULES_DOCKER_VERSION = "553d5506bb7325185950f91533b967da8f5bc536"

BAZEL_RELEASES = {
    "0.12.0": "3d94ca21477289fa369c6077564719dbd89052e6199a527cfa0506bb41c82cd5",
    "0.14.0": "0d05210e0f68ba46dcef986c16acb486c16348fb373819f76658447c12ad9d89",
    "0.14.1": "31946d067901fb10e38a6497996906b5c777feffabe1b3de0039cac0c3c02318",
}

def bazel_dependencies():
    [native.http_file(
        name = "bazel_release_%s" % version.replace('.', '_'),
        sha256 = sha256,
        url = "https://github.com/bazelbuild/bazel/releases/download/{v}/bazel_{v}-linux-x86_64.deb".format(v = version),
    ) for version, sha256 in BAZEL_RELEASES.items()]

    
def distroless_bazel_repositories():
    existing = native.existing_rules()
    if "io_bazel_rules_go" not in existing:
        native.git_repository(
            name = "io_bazel_rules_go",
            remote = "https://github.com/bazelbuild/rules_go.git",
            commit = "161c91485b007c6bf51c0e81808cf4ee2ded299d",
        )

    if "io_bazel_rules_docker" not in existing:
        native.http_archive(
            name = "io_bazel_rules_docker",
            url = "https://github.com/bazelbuild/rules_docker/archive/%s.zip" % RULES_DOCKER_VERSION,
            strip_prefix = "rules_docker-" + RULES_DOCKER_VERSION,
            sha256 = "e0b3d966f2a5c0fe921b6294df7c823afa63b4c439f0a7f3b9da3ed6534bab83",
        )

    if "distroless" not in existing:
        native.git_repository(
            name = "distroless",
            commit = "813d1ddef217f3871e4cb0a73da100aeddc638ee",
            remote = "https://github.com/GoogleContainerTools/distroless.git",
        )

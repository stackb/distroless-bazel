load(
    "@io_bazel_rules_docker//container:container.bzl",
    container_repositories = "repositories",
    "container_pull",
)

load(
    "@io_bazel_rules_docker//java:image.bzl",
    java_image_repositories = "repositories",
)

def container_dependencies():
    container_repositories()
    java_image_repositories()

    container_pull(
        name = "java_base",
        registry = "gcr.io",
        repository = "distroless/java",
        digest = "sha256:625c3584876171c6d786d8d8a74b2aaceac06fef450e7fd7322247464f118aa9",
    )
    

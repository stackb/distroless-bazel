<table><tr>
<td><img src="https://bazel.build/images/bazel-icon.svg" height="120"/></td>
<td><img src="https://github.com/GoogleContainerTools.png" height="120"/></td>
<td><img src="https://github.com/docker.png" height="120"/></td>
</tr><tr>
<td>Bazel</td>
<td>Distroless</td>
<td>Docker</td>
</tr></table>

# `distroless-bazel`

This repository houses instructions for generating a container image containing
bazel in the style of [distroless](https://github.com/GoogleContainerTools/distroless).

``` sh
$ docker run gcr.io/stack-build/distroless/bazel:0.14.1 version
Extracting Bazel installation...
Build label: 0.14.1
Build target: bazel-out/k8-opt/bin/src/main/java/com/google/devtools/build/lib/bazel/BazelServer_deploy.jar
Build time: Fri Jun 8 12:17:35 2018 (1528460255)
Build timestamp: 1528460255
Build timestamp as int: 1528460255
```

## Versions

Images are available on gcr.io and index.docker.io:

| Bazel Version | Tag | Size |
| ---: | :--- | :--- |
| 0.12.0 | [gcr.io/stack-build/distroless/bazel:0.12.0](https://console.cloud.google.com/gcr/images/stack-build/GLOBAL/distroless/bazel@sha256:8703c13c8a555495dca55869d9306decbb8a65fac87bd14197147a927e0df651/dtails/info) | 248MB |
| 0.14.0 | [gcr.io/stack-build/distroless/bazel:0.14.0](https://console.cloud.google.com/gcr/images/stack-build/GLOBAL/distroless/bazel@sha256:df629f0084f2e30eb7f11012098787fe889d6a388b6e7f96d169e54a3e056cca/details/info) | 257MB |
| 0.14.1 | [gcr.io/stack-build/distroless/bazel:0.14.1](https://console.cloud.google.com/gcr/images/stack-build/GLOBAL/distroless/bazel@sha256:1ee9e6756c1b3d762327d923a836df75b0fb11d35feaf43fab34629ae3b287b7/details/info) | 257MB |

| Bazel Version | Tag | Size |
| ---: | :--- | :--- |
| 0.12.0 | [index.docker.io/stackb/distroless-bazel:0.12.0](https://hub.docker.com/r/stackb/distroless-bazel/) | 248MB |
| 0.14.0 | [index.docker.io/stackb/distroless-bazel:0.14.0](https://hub.docker.com/r/stackb/distroless-bazel/) | 257MB |
| 0.14.1 | [index.docker.io/stackb/distroless-bazel:0.14.1](https://hub.docker.com/r/stackb/distroless-bazel/) | 257MB |

## Development

Fork this repository, update the bazel version as needed and/or add dependencies as appropriate.

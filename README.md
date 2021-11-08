# Bazel rules for kubeconform

## Installation

Include this in your WORKSPACE file:

```starlark
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "slamdev_rules_kubeconform",
    url = "https://github.com/slamdev/rules_kubeconform/releases/download/0.0.0/slamdev_rules_kubeconform-v0.0.0.tar.gz",
    sha256 = "",
)

load("@slamdev_rules_kubeconform//kubeconform:deps.bzl", "kubeconform_register_toolchains", "rules_kubeconform_dependencies")

rules_kubeconform_dependencies()

kubeconform_register_toolchains(
    name = "kubeconform0_4_12",
    kubeconform_version = "0.4.12",
)
```

> note, in the above, replace the version and sha256 with the one indicated
> in the release notes for rules_kubeconform.

# Declare the local Bazel workspace.
# This is *not* included in the published distribution.
workspace(
    name = "slamdev_rules_kubeconform",
)

load(":internal_deps.bzl", "rules_kubeconform_internal_deps")

# Fetch deps needed only locally for development
rules_kubeconform_internal_deps()

load("//kubeconform:repositories.bzl", "kubeconform_register_toolchains", "rules_kubeconform_dependencies")

# Fetch our "runtime" dependencies which users need as well
rules_kubeconform_dependencies()

kubeconform_register_toolchains(
    name = "kubeconform0_4_12",
    kubeconform_version = "0.4.12",
)

load("//kubeconform:defs.bzl", "kubeconform_import")

kubeconform_import(
    name = "kubernetes_json_schema",
    commit = "752d01fde722dc4f3dab1c6aa2e9f32c88446f5c",
    github_repo = "yannh/kubernetes-json-schema",
    kube_version = "1.21.5",
    resources = {
        "Deployment": ["apps/v1"],
    },
)

############################################
# Gazelle, for generating bzl_library targets
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.17.2")

gazelle_dependencies()

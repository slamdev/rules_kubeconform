"# Kubeconform Rules"

load("//kubeconform/private/rules:lint.bzl", "lint_test")
load("//kubeconform/private/rules:import.bzl", _import = "kubeconform_import")

kubeconform_lint_test = lint_test
kubeconform_import = _import

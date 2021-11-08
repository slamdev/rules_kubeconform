"kubeconform_lint_test rule"

load("@bazel_skylib//lib:collections.bzl", "collections")

_DOC = "Defines a kubeconform lint execution."

_ATTRS = {
    "srcs": attr.label_list(
        doc = "Yaml files to lint.",
        allow_files = [".yaml", ".yml"],
    ),
    "ignore_filename_patterns": attr.string_list(
        doc = "Regular expression specifying paths to ignore.",
    ),
    "ignore_missing_schemas": attr.bool(
        doc = "Skip files with missing schemas instead of failing.",
    ),
    "insecure_skip_tls_verify": attr.bool(
        doc = "Disable verification of the server's SSL certificate.",
    ),
    "kubernetes_version": attr.string(
        doc = "Version of Kubernetes to validate against, e.g.: 1.18.0 (default master).",
    ),
    "concurrency": attr.int(
        doc = "Number of goroutines to run concurrently.",
        default = 4,
    ),
    "reject": attr.string_list(
        doc = "List of kinds to reject.",
    ),
    "skip": attr.string_list(
        doc = "List of kinds to ignore.",
    ),
    "strict": attr.bool(
        doc = "Disallow additional properties not in schema.",
    ),
    "output": attr.string(
        doc = "Output format",
        values = ["json", "junit", "tap", "text"],
        default = "text",
    ),
    "schema_locations": attr.label_list(
        doc = "Override schemas location search paths",
    ),
}

def _impl(ctx):
    cmd = [ctx.var["KUBECONFORM_BIN"]]
    for p in ctx.attr.ignore_filename_patterns:
        cmd += ["-ignore-filename-pattern", p]
    if ctx.attr.ignore_missing_schemas:
        cmd += ["-ignore-missing-schemas"]
    if ctx.attr.insecure_skip_tls_verify:
        cmd += ["-insecure-skip-tls-verify"]
    if ctx.attr.kubernetes_version:
        cmd += ["-kubernetes-version", ctx.attr.kubernetes_version]
    if ctx.attr.reject:
        cmd += ["-reject", ",".join(ctx.attr.reject)]
    if ctx.attr.skip:
        cmd += ["-skip", ",".join(ctx.attr.skip)]
    if ctx.attr.strict:
        cmd += ["-strict"]

    dirs = []
    for schema in ctx.files.schema_locations:
        dirs += [schema.dirname]
    dirs = collections.uniq(dirs)
    for d in dirs:
        cmd += ["-schema-location", "'" + "/".join([d, "{{ .ResourceKind }}{{ .KindSuffix }}.json"]) + "'"]

    cmd += ["-n", str(ctx.attr.concurrency)]
    cmd += ["-output", ctx.attr.output]

    for f in ctx.files.srcs:
        cmd += [f.short_path]

    executable = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.write(output = executable, content = " ".join(cmd))
    runfiles = ctx.runfiles(files = ctx.toolchains["@slamdev_rules_kubeconform//kubeconform:toolchain_type"].default.files.to_list() + ctx.files.srcs + ctx.files.schema_locations)
    return [
        DefaultInfo(
            executable = executable,
            runfiles = runfiles,
        ),
    ]

lint_test = rule(
    doc = _DOC,
    implementation = _impl,
    attrs = _ATTRS,
    provides = [DefaultInfo],
    test = True,
    toolchains = ["@slamdev_rules_kubeconform//kubeconform:toolchain_type"],
)

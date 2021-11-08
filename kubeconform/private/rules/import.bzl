"kubeconform_import rule"

_DOC = "Defines an imported kubeconform schemas."

_ATTRS = {
    "github_repo": attr.string(
        doc = "GitHub repo name.",
        mandatory = True,
    ),
    "commit": attr.string(
        doc = "Commit.",
        mandatory = True,
    ),
    "kube_version": attr.string(
        doc = "Kubernetes version.",
        mandatory = True,
    ),
    "resources": attr.string_list_dict(
        doc = "Resource schemas to import.",
        mandatory = True,
    ),
}

def _impl(repository_ctx):
    file_name_tpl = "{}-{}.json"
    url_tpl = "https://raw.githubusercontent.com/{}/{}/v{}-standalone-strict/{}"
    for res, versions in repository_ctx.attr.resources.items():
        for version in versions:
            file_name = file_name_tpl.format(res.lower(), version.lower().replace("/", "-"))
            url = url_tpl.format(
                repository_ctx.attr.github_repo,
                repository_ctx.attr.commit,
                repository_ctx.attr.kube_version,
                file_name,
            )
            repository_ctx.download(
                output = file_name,
                url = url,
            )
    repository_ctx.file("BUILD.bazel", content = """
package(default_visibility = ["//visibility:public"])
filegroup(
    name = "schemas",
    srcs = glob(["*.json"]),
)
    """.format(file_name))

kubeconform_import = repository_rule(
    doc = _DOC,
    implementation = _impl,
    attrs = _ATTRS,
)

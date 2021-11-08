<!-- Generated with Stardoc: http://skydoc.bazel.build -->

# Kubeconform Rules

<a id="#kubeconform_import"></a>

## kubeconform_import

<pre>
kubeconform_import(<a href="#kubeconform_import-name">name</a>, <a href="#kubeconform_import-commit">commit</a>, <a href="#kubeconform_import-github_repo">github_repo</a>, <a href="#kubeconform_import-kube_version">kube_version</a>, <a href="#kubeconform_import-repo_mapping">repo_mapping</a>, <a href="#kubeconform_import-resources">resources</a>)
</pre>

Defines an imported kubeconform schemas.

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="kubeconform_import-name"></a>name |  A unique name for this repository.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="kubeconform_import-commit"></a>commit |  Commit.   | String | required |  |
| <a id="kubeconform_import-github_repo"></a>github_repo |  GitHub repo name.   | String | required |  |
| <a id="kubeconform_import-kube_version"></a>kube_version |  Kubernetes version.   | String | required |  |
| <a id="kubeconform_import-repo_mapping"></a>repo_mapping |  A dictionary from local repository name to global repository name. This allows controls over workspace dependency resolution for dependencies of this repository.&lt;p&gt;For example, an entry <code>"@foo": "@bar"</code> declares that, for any time this repository depends on <code>@foo</code> (such as a dependency on <code>@foo//some:target</code>, it should actually resolve that dependency within globally-declared <code>@bar</code> (<code>@bar//some:target</code>).   | <a href="https://bazel.build/docs/skylark/lib/dict.html">Dictionary: String -> String</a> | required |  |
| <a id="kubeconform_import-resources"></a>resources |  Resource schemas to import.   | <a href="https://bazel.build/docs/skylark/lib/dict.html">Dictionary: String -> List of strings</a> | required |  |


<a id="#kubeconform_lint_test"></a>

## kubeconform_lint_test

<pre>
kubeconform_lint_test(<a href="#kubeconform_lint_test-name">name</a>, <a href="#kubeconform_lint_test-concurrency">concurrency</a>, <a href="#kubeconform_lint_test-ignore_filename_patterns">ignore_filename_patterns</a>, <a href="#kubeconform_lint_test-ignore_missing_schemas">ignore_missing_schemas</a>,
                      <a href="#kubeconform_lint_test-insecure_skip_tls_verify">insecure_skip_tls_verify</a>, <a href="#kubeconform_lint_test-kubernetes_version">kubernetes_version</a>, <a href="#kubeconform_lint_test-output">output</a>, <a href="#kubeconform_lint_test-reject">reject</a>, <a href="#kubeconform_lint_test-schema_locations">schema_locations</a>,
                      <a href="#kubeconform_lint_test-skip">skip</a>, <a href="#kubeconform_lint_test-srcs">srcs</a>, <a href="#kubeconform_lint_test-strict">strict</a>)
</pre>

Defines a kubeconform lint execution.

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="kubeconform_lint_test-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="kubeconform_lint_test-concurrency"></a>concurrency |  Number of goroutines to run concurrently.   | Integer | optional | 4 |
| <a id="kubeconform_lint_test-ignore_filename_patterns"></a>ignore_filename_patterns |  Regular expression specifying paths to ignore.   | List of strings | optional | [] |
| <a id="kubeconform_lint_test-ignore_missing_schemas"></a>ignore_missing_schemas |  Skip files with missing schemas instead of failing.   | Boolean | optional | False |
| <a id="kubeconform_lint_test-insecure_skip_tls_verify"></a>insecure_skip_tls_verify |  Disable verification of the server's SSL certificate.   | Boolean | optional | False |
| <a id="kubeconform_lint_test-kubernetes_version"></a>kubernetes_version |  Version of Kubernetes to validate against, e.g.: 1.18.0 (default master).   | String | optional | "" |
| <a id="kubeconform_lint_test-output"></a>output |  Output format   | String | optional | "text" |
| <a id="kubeconform_lint_test-reject"></a>reject |  List of kinds to reject.   | List of strings | optional | [] |
| <a id="kubeconform_lint_test-schema_locations"></a>schema_locations |  Override schemas location search paths   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | optional | [] |
| <a id="kubeconform_lint_test-skip"></a>skip |  List of kinds to ignore.   | List of strings | optional | [] |
| <a id="kubeconform_lint_test-srcs"></a>srcs |  Yaml files to lint.   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | optional | [] |
| <a id="kubeconform_lint_test-strict"></a>strict |  Disallow additional properties not in schema.   | Boolean | optional | False |



#!/bin/bash

docker build -t openapi2jsonschema .

SCHEMAS=(
  "https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.52.0/example/prometheus-operator-crd/monitoring.coreos.com_prometheusrules.yaml"
)

for s in "${SCHEMAS[@]}"; do
   docker run -v "$(pwd):/opt" openapi2jsonschema "$s"
done

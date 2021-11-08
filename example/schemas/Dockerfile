FROM python:3.9.7-alpine3.14

ENV FILENAME_FORMAT='{kind}-{group}-{version}'

WORKDIR /opt

RUN wget -O /tmp/openapi2jsonschema https://raw.githubusercontent.com/yannh/kubeconform/v0.4.12/scripts/openapi2jsonschema.py \
   && chmod +x /tmp/openapi2jsonschema \
   && python3 -m pip install pyyaml

ENTRYPOINT ["/tmp/openapi2jsonschema"]

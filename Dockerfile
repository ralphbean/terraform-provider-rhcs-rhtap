FROM registry.access.redhat.com/ubi9/go-toolset:latest AS builder
COPY . .

ENV GOFLAGS=-buildvcs=false
RUN git config --global --add safe.directory /opt/app-root/src && \
    make prepare_release

FROM registry.access.redhat.com/ubi9/ubi-micro:latest
LABEL description="Terraform Provider RHCS"
LABEL io.k8s.description="Terraform Provider RHCS"
LABEL com.redhat.component="terraform-provider-rhcs"
LABEL distribution-scope="test"
LABEL name="terraform-provider-rhcs" release="X.Y" url="https://github.com/enriquebelarte/terraform-provider-rhcs-rhtap"
LABEL vendor="Red Hat, Inc."
LABEL version="X.Y"

COPY --from=builder /opt/app-root/src/releases /releases

ARG ROOT_IMAGE=ubuntu:noble

FROM ${ROOT_IMAGE}

ENV LANG=en_US.UTF-8
ENV TZ="Etc/UTC"

ARG DYNARE_RELEASE="latest"

COPY scripts/install_dynare.sh /init_scripts/install_dynare.sh
RUN /init_scripts/install_dynare.sh
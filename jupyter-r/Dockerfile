ARG ROOT_IMAGE=ubuntu:noble

FROM ${ROOT_IMAGE}

ENV LANG=en_US.UTF-8
ENV TZ="Etc/UTC"

ENV PYTHON_VERSION="3.10"

COPY scripts/requirements.txt /init_scripts/requirements.txt
COPY scripts/install_python.sh /init_scripts/install_python.sh
RUN /init_scripts/install_python.sh

ENV R_VERSION="4.4.2"
ENV R_HOME="/usr/local/lib/R"

COPY scripts/install_R_source.sh /init_scripts/install_R_source.sh
RUN /init_scripts/install_R_source.sh

COPY scripts/bin/ /init_scripts/bin/
COPY scripts/r_libs /init_scripts/r_libs
COPY scripts/r_jupyter_kernel.r /init_scripts/r_jupyter_kernel.r
COPY scripts/setup_R.sh /init_scripts/setup_R.sh
RUN /init_scripts/setup_R.sh

COPY scripts/install_pandoc.sh /init_scripts/install_pandoc.sh
RUN /init_scripts/install_pandoc.sh

COPY scripts/install_quarto.sh /init_scripts/install_quarto.sh
RUN /init_scripts/install_quarto.sh

EXPOSE 8888

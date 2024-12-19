ARG ROOT_IMAGE=ubuntu:noble

FROM ${ROOT_IMAGE}

ENV LANG=en_US.UTF-8
ENV TZ="Etc/UTC"

ENV PYTHON_VERSION="3.9"

COPY scripts/requirements.txt /init_scripts/requirements.txt
COPY scripts/install_python.sh /init_scripts/install_python.sh
RUN /init_scripts/install_python.sh

COPY scripts/install_pandoc.sh /init_scripts/install_pandoc.sh
RUN /init_scripts/install_pandoc.sh

COPY scripts/install_quarto.sh /init_scripts/install_quarto.sh
RUN /init_scripts/install_quarto.sh

EXPOSE 8888

# To run jupyter lab server automatically
# CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token='nquant'"]
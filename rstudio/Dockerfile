ARG ROOT_IMAGE=ubuntu:noble

FROM ${ROOT_IMAGE}

ENV LANG=en_US.UTF-8
ENV TZ="Etc/UTC"

ENV R_VERSION="4.4.2"
ENV R_HOME="/usr/local/lib/R"

COPY scripts/install_R_source.sh /init_scripts/install_R_source.sh
RUN /init_scripts/install_R_source.sh

COPY scripts/bin/ /init_scripts/bin/
COPY scripts/r_libs /init_scripts/r_libs
COPY scripts/setup_R.sh /init_scripts/setup_R.sh
RUN /init_scripts/setup_R.sh

ENV S6_VERSION="v2.2.0.3"
ENV RSTUDIO_VERSION="2024.12.0+474"

COPY scripts/install_rstudio.sh /init_scripts/install_rstudio.sh
COPY scripts/install_s6init.sh /init_scripts/install_s6init.sh
COPY scripts/default_user.sh /init_scripts/default_user.sh
COPY scripts/init_set_env.sh /init_scripts/init_set_env.sh
COPY scripts/init_userconf.sh /init_scripts/init_userconf.sh
COPY scripts/pam-helper.sh /init_scripts/pam-helper.sh
RUN /init_scripts/install_rstudio.sh

COPY scripts/install_pandoc.sh /init_scripts/install_pandoc.sh
RUN /init_scripts/install_pandoc.sh

COPY scripts/install_quarto.sh /init_scripts/install_quarto.sh
RUN /init_scripts/install_quarto.sh

EXPOSE 8787

# To run RStudio Server automatically
# CMD ["/init"]
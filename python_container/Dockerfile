FROM mambaorg/micromamba:1.5.8-lunar

COPY --chown=$MAMBA_USER:$MAMBA_USER conda.yml /tmp/conda.yml

RUN micromamba install -y -n base -f /tmp/conda.yml \
    && micromamba install -y -n base conda-forge::procps-ng \
    && micromamba clean -a -y

USER root

ENV MPLCONFIGDIR=/tmp/matplotlib_config
RUN mkdir -p /tmp/matplotlib_config
RUN chmod -R 777 /tmp/matplotlib_config

ENV PATH="$MAMBA_ROOT_PREFIX/bin:$PATH"
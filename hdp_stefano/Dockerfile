FROM rocker/r-ver:4.2.1

# Fix the /bin directory issue by installing usrmerge
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    usrmerge && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install additional dependencies
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    zlib1g-dev \
    slurm-wlm \
    git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install R libraries
RUN Rscript -e '.libPaths("/usr/local/lib/R/site-library")'
RUN Rscript -e 'install.packages(pkgs = "pkgdown");library("pkgdown")'
RUN Rscript -e 'install.packages(pkgs = "devtools");library("devtools")'
RUN Rscript -e 'devtools::install_github("nicolaroberts/hdp", build_vignettes = FALSE);library(hdp)'


RUN git clone https://github.com/McGranahanLab/HDP_sigExtraction.git /app/HDP_sigExtraction

RUN rm -r /app/HDP_sigExtraction/HDP_wrapper.sh /app/HDP_sigExtraction/data /app/HDP_sigExtraction/examples

# Install dependencies for HDP_sigExtraction
RUN Rscript -e 'install.packages(pkgs = "BiocManager");library("BiocManager")'
RUN Rscript -e 'BiocManager::install("BiocStyle");library("BiocStyle")'
RUN Rscript -e 'BiocManager::install("BiocGenerics");library("BiocGenerics")'
RUN Rscript -e 'BiocManager::install("Biostrings");library("Biostrings")'
RUN Rscript -e 'BiocManager::install("GenomicRanges");library("GenomicRanges")'
RUN Rscript -e 'BiocManager::install("IRanges");library("IRanges")'
RUN Rscript -e 'install.packages(pkgs = "ggplot2");library("ggplot2")'
RUN Rscript -e 'install.packages(pkgs = "lsa");library("lsa")'
RUN Rscript -e 'BiocManager::install("RColorBrewer");library("RColorBrewer")'
RUN Rscript -e 'BiocManager::install("Metrics");library("Metrics")'
RUN Rscript -e 'BiocManager::install("deconstructSigs");library("deconstructSigs")'

ENV PATH="/app/HDP_sigExtraction/R:$PATH"


# # Install additional dependencies
# RUN apt-get update -y && \
#     apt-get install -y --no-install-recommends \
#     libbz2-dev \
#     liblzma-dev \
#     libncurses-dev \
#     libhts-dev \
#     libreadline-dev \
#     && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*

# RUN Rscript -e 'BiocManager::install("GenomicFeatures");library("GenomicFeatures")'

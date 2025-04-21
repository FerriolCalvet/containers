FROM rocker/r-ver:4.2.1

# Install dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    build-essential \
    git \
    pandoc

# Clone the repository and apply the patch
RUN git clone https://github.com/nicolaroberts/hdp.git /tmp/hdp
# RUN sed -i '1i#ifndef R_UTILS_H\n#define R_UTILS_H' /tmp/hdp/src/R-utils.h && \
#     echo '#endif // R_UTILS_H' >> /tmp/hdp/src/R-utils.h


# Install the package
RUN Rscript -e 'install.packages("remotes")'
RUN Rscript -e 'install.packages("devtools")'
RUN Rscript -e 'install.packages("knitr")'
RUN Rscript -e 'install.packages("rmarkdown")'

RUN Rscript -e 'if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")'
RUN Rscript -e 'BiocManager::install("BiocStyle");library("BiocStyle")'

RUN Rscript -e 'remotes::install_local("/tmp/hdp", build_vignettes = FALSE)'

# Clean up
RUN rm -rf /tmp/hdp

CMD ["R"]

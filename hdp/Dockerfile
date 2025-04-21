FROM r-base:4.2.1

RUN apt-get update -y
#RUN apt-get update -y && \
#    apt-get upgrade -y 

# Specify path for installing R libraries inside container
RUN Rscript -e '.libPaths("/usr/local/lib/R/site-library")'

RUN apt-get -y install libcurl4-openssl-dev libxml2-dev build-essential libssl-dev libbz2-dev liblzma-dev libfontconfig1-dev libharfbuzz-dev libfribidi-dev libtiff5-dev

RUN Rscript -e 'install.packages(pkgs = "pkgdown");library("pkgdown")'
# Install R package hdp
RUN Rscript -e 'install.packages(pkgs = "devtools");library("devtools")'

RUN Rscript -e 'devtools::install_github("nicolaroberts/hdp", build_vignettes = TRUE)'

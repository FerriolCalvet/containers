FROM python:3.10.12

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y git libcurl4-openssl-dev procps

RUN mkdir -p /bgdatacache/ /home/user/.config/bbglab/

ENV BGDATA_LOCAL="/bgdatacache"
ENV BBGLAB_HOME="/home/user/.config/bbglab/"

RUN pip install bgdata bgreference

RUN echo "# Version of the bgdata config file\n\
version = 2\n\
\n\
# The default local folder where you want to store the data packages\n\
local_repository = \"/bgdatacache\"\n\
\n\
# The remote URL from where do you want to download the data packages\n\
remote_repository = \"https://bbglab.irbbarcelona.org/bgdata\"\n\
\n\
# If you want to force bgdata to work only locally\n\
# offline = True\n\
\n\
# Cache repositories\n\
[cache_repositories]" > /home/user/.config/bbglab/bgdatav2.conf

RUN bgdata get datasets/genomereference/hg38 && bgdata get datasets/genomereference/hg19
RUN bgdata get datasets/genomereference/mm39 && bgdata get datasets/genomereference/mm10

RUN python3 -c "from bgreference import hg38, hg19; hg38(1, 1300000, 3000); hg19(1, 1300000, 3000)"
RUN python3 -c "from bgreference import mm39, mm10; mm39(1, 1300000, 3000); mm10(1, 1300000, 3000)"

RUN chmod -R 777 /bgdatacache/*


# Copy the entire directory from your local machine into the container
COPY omega /omega

# Install the Python dependencies listed in the requirements.txt
RUN pip install --default-timeout=100000 -r /omega/requirements.txt

# Install the omega package
RUN pip install --no-cache-dir /omega



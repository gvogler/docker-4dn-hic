FROM ubuntu:22.04
MAINTAINER Soo Lee (duplexa@gmail.com)

LABEL comment="Dockerfile to create docker image on Apple Silicon"
LABEL comment2="This file is forked from duplexa/4dn-hic:v43 and was edited by Geo Vogler"
LABEL version="ARM 0.1"
LABEL description="Docker image to run scripts from 4DN."

ENV DEBIAN_FRONTEND noninteractive

# 1. general updates & installing necessary Linux components
RUN apt-get update -y && apt-get install -y \
    bzip2 \
    gcc \
    git \
    less \
    libncurses-dev \
    make \
    time \
    unzip \
    vim \
    wget \
    zlib1g-dev \
    liblz4-tool

# installing python3 & pip
RUN apt-get update -y && apt-get install -y \
    python3-setuptools \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python3 get-pip.py
# Set to correct python version


# installing java (for nozzle) - latest java version
RUN apt-get update -y && apt-get install -y default-jdk 

# installing R & dependencies for pairsqc
# r-base, r-base-dev for R, libcurl4-openssl-dev, libssl-dev for devtools
RUN apt-get update -y && apt-get install -y \
    build-essential \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    r-base \
    r-base-dev

RUN R -e 'install.packages("remotes")' \
RUN R -e 'install.packages("devtools", repos="http://cran.us.r-project.org")' \ # devtools 
RUN R -e 'install.packages( "Nozzle.R1", type="source", repos="http://cran.us.r-project.org" )' \ # nozzle
RUN R -e 'remotes::install_github("SooLee/plotosaurus")' \ # plotosaurus
RUN R -e 'install.packages("stringr", repos="http://cran.us.r-project.org" )'

# installing brew & md5sha1sum
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
RUN brew install md5sha1sum
ENV PATH=/sbin:$PATH
RUN ls


# installing conda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
CMD ["sudo ln -s md5sum /bin/md5"]
CMD ["chmod +x Miniconda3-latest-MacOSX-arm64.sh"]
CMD ["./Miniconda3-latest-MacOSX-arm64.sh -b -p $HOME/miniconda3 -b"] 
ENV PATH=/$HOME/miniconda3/bin:$PATH
CMD ["conda update -y conda"]
RUN rm Miniconda3-latest-MacOSX-arm64.sh

# installing gawk for juicer
RUN apt-get update -y && apt-get install -y gawk \
    gcc-aarch64-linux-gnu\
    python3-dev \
    && echo 'alias awk=gawk' >> ~/.bashrc

# download tools
WORKDIR /usr/local/bin
COPY downloads.sh .
RUN . downloads.sh

# set path
ENV PATH=/usr/local/bin/bwa/:$PATH
ENV PATH=/usr/local/bin/samtools/:$PATH
ENV PATH=/usr/local/bin/pairix/bin/:/usr/local/bin/pairix/util/:$PATH
ENV PATH=/usr/local/bin/pairix/util/bam2pairs/:$PATH
ENV PATH=/usr/local/bin/pairsqc/:$PATH
ENV PATH=/usr/local/bin/juicer/CPU/:/usr/local/bin/juicer/CPU/common:$PATH
ENV PATH=/usr/local/bin/hic2cool/:$PATH
ENV PATH=/usr/local/bin/mcool2hic/:$PATH
ENV PATH=/usr/local/bin/FastQC/:$PATH

# supporting UTF-8
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# wrapper
COPY scripts/ .
RUN chmod +x run*.sh

# default command
CMD ["run-list.sh"]


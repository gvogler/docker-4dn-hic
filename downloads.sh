#!/bin/sh


## SOFTWARE: bwa
## VERSION: 0.7.17
## TYPE: aligner
## SOURCE_URL: https://github.com/lh3/bwa
wget https://github.com/lh3/bwa/archive/v0.7.17.tar.gz
tar -xzf v0.7.17.tar.gz
cd bwa-0.7.17
make
cd ..
ln -s bwa-0.7.17 bwa


## SOFTWARE: samtools
## VERSION: 1.17
## TYPE: file format converter
## SOURCE_URL: https://github.com/samtools/samtools
wget https://github.com/samtools/samtools/releases/download/1.17/samtools-1.17.tar.bz2

tar -xjf samtools-1.17.tar.bz2
cd samtools-1.17
make
cd ..
ln -s samtools-1.17 samtools


## SOFTWARE: pairix
## VERSION: 0.3.7
## TYPE: file format converter,indexer
## SOURCE_URL: https://github.com/4dn-dcic/pairix
wget https://github.com/4dn-dcic/pairix/archive/refs/tags/0.3.7.tar.gz
tar -xzf 0.3.7.tar.gz
rm 0.3.7.tar.gz
cd pairix-0.3.7
make
cd ..
ln -s pairix-0.3.6 pairix


## SOFTWARE: cooler
## VERSION: 0.9.1
## TYPE: aggregator,normalizer
## SOURCE_URL: https://github.com/mirnylab/cooler
pip install --no-cache-dir cooler==0.9.1


## SOFTWARE: pairsqc
## VERSION: 0.2.3
## TYPE: quality metric generator
## SOURCE_URL: https://github.com/4dn-dcic/pairsqc
wget https://github.com/4dn-dcic/pairsqc/archive/0.2.3.tar.gz
tar -xzf 0.2.3.tar.gz
rm 0.2.3.tar.gz
ln -s pairsqc-0.2.3 pairsqc


## SOFTWARE: juicer_tools
## VERSION: 2.20.00
## TYPE: aggregator,normalizer
## SOURCE_URL: https://github.com/theaidenlab/juicebox
wget https://github.com/aidenlab/Juicebox/releases/download/v2.20.00/juicer_tools.2.20.00.jar
ln -s /usr/local/bin/juicer_tools.2.20.00.jar juicer_tools.jar


## SOFTWARE: juicer
## COMMIT: 290e443dd06f737109e5d93b4f4ae3cadd94ddef
## TYPE: aligner,file format converter,sorter,annotater,filter,aggregator,normalizer
## SOURCE_URL: https://github.com/theaidenlab/juicer
git clone -n git@github.com:aidenlab/juicer.git
cd juicer
git checkout 290e443dd06f737109e5d93b4f4ae3cadd94ddef
chmod +x CPU/* CPU/common/*
ln -s CPU scripts
cd ..


## SOFTWARE: hic2cool
## VERSION: 0.8.3
## TYPE: file format converter
## SOURCE_URL: https://github.com/4dn-dcic/hic2cool
pip3 install hic2cool==0.8.3


## SOFTWARE: pairtools
## VERSION: 1.0.2
## TYPE: file format converter,sorter,annotater,filter
## SOURCE_URL: https://github.com/mirnylab/pairtools
conda config --add channels conda-forge
conda config --add channels bioconda
conda install -y pbgzip
conda install -y coreutils
pip3 install numpy Cython click pairtools==1.0.2


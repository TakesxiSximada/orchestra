# -*- coding: utf-8 -*-
FROM ubuntu:latest
MAINTAINER TakesxiSximada @TakesxiSximada
ENV NGINX_VERSION 1.7.7-1~wheezy


RUN apt-get update -y
RUN apt-get install -y wget

RUN mkdir -p /downloads
RUN mkdir -p /work

# Install "mini" anaconda python distribution (python 3).

RUN cd /downloads && wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda-installer.sh
RUN /bin/bash /downloads/miniconda-installer.sh -b -p work/anaconda/

# Install python libraries
RUN /work/anaconda/bin/conda install --yes pip
RUN /work/anaconda/bin/conda install --yes numpy
RUN /work/anaconda/bin/conda install --yes scipy
RUN /work/anaconda/bin/conda install --yes matplotlib
RUN /work/anaconda/bin/conda install --yes ipython
RUN /work/anaconda/bin/conda install --yes scikit-learn
RUN /work/anaconda/bin/conda install --yes scikit-image
RUN /work/anaconda/bin/conda install --yes pandas
RUN /work/anaconda/bin/conda install --yes requests
RUN /work/anaconda/bin/conda install --yes h5py
RUN /work/anaconda/bin/conda install --yes pandas

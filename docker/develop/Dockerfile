# -*- coding: utf-8 -*-
FROM ubuntu:latest
MAINTAINER TakesxiSximada @TakesxiSximada
ENV NGINX_VERSION 1.7.7-1~wheezy

# apt-get
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-add-repository -y 'deb http://packages.treasure-data.com/debian/ lucid contrib' && \
RUN \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0xcbcb082a1bb943db && \
    echo "deb http://mariadb.mirror.iweb.com/repo/10.0/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/mariadb.list
RUN \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list

# update apt
RUN apt-get install -y aptitude
RUN aptitude update
RUN aptitude upgrade
RUN apt-get update

# set key apt
RUN add-apt-repository -y ppa:git-core/ppa
RUN add-apt-repository -y ppa:webupd8team/java

# INSTALL
RUN apt-get install -y build-essential
RUN apt-get install -y software-properties-common
RUN apt-get install -y byobu
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y htop
RUN apt-get install -y man
RUN apt-get install -y unzip
RUN apt-get install -y vim
RUN apt-get install -y wget
RUN apt-get install -y supervisor
RUN apt-get install -y mecab libmecab-dev mecab-ipadic
RUN apt-get install -y libblas-dev
RUN apt-get install -y liblapack-dev
RUN apt-get install -y gfortran
RUN apt-get install -y g++
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y nginx
RUN apt-get install -y td-agent
RUN apt-get install -y redis-server
RUN apt-get install -y libglib2.0-dev
RUN apt-get install -y libXpm-dev
RUN apt-get install -y libjpeg-dev
RUN apt-get install -y libgif-dev
RUN apt-get install -y libtiff4-dev
RUN apt-get install -y libncurses5-dev
RUN apt-get install -y emacs24
RUN apt-get install -y mongodb-org
RUN apt-get install -y tmux
RUN apt-get install -y python2.7-dev
RUN apt-get install -y python3.4-dev
RUN apt-get install -y libatlas-base-dev
RUN apt-get install -y g++
RUN apt-get install -y gfortran
RUN apt-get install -y libopenblas-dev
RUN apt-get install -y liblapack-dev
RUN apt-get install -y build-essential
RUN apt-get install -y python3-tk
RUN apt-get install -y tk-dev
RUN apt-get install -y libpng12-dev
RUN apt-get install -y clang
RUN apt-get install -y libzmq-dev
RUN apt-get install -y libcv-dev libhighgui-dev libcvaux-dev python-opencv opencv-doc
RUN apt-get install -y libudev-dev
RUN apt-get install -y openjdk-6-jdk
RUN apt-get install -y freeglut3-dev
RUN apt-get install -y doxygen
RUN apt-get install -y graphviz
RUN apt-get install -y libopencv-dev


# anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv
RUN echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.sximadarc
RUN echo 'eval "$(anyenv init -)"' >> ~/.sximadarc
RUN exec $SHELL -l
RUN echo 'source ~/.sximadarc' >> ~/.bashrc
RUN echo 'source ~/.sximadarc' >> ~/.zshrc


RUN curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python
RUN pip install -U setuptools
RUN pip install virtualenv
RUN pip install virtualenvwrapper
RUN pip install httpie
RUN pip install s3cmd
RUN pip install awscli

# virtualenvwrapper


# gunosy
# RUN pip install "https://mecab.googlecode.com/files/mecab-python-0.996.tar.gz"
# RUN pip install "git+https://code.google.com/p/feedparser/"
# RUN pip install "git+https://github.com/misja/python-boilerpipe"



# anaconda
RUN wget http://repo.continuum.io/anaconda3/Anaconda3-2.0.1-Linux-x86_64.sh
# pip install mecab-python3



# nginx
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log
VOLUME ["/var/cache/nginx"]
EXPOSE 80 443
RUN nginx -g

# td-agent
EXPOSE 8888
RUN /etc/init.d/td-agent start

# mariadb
RUN \
  DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server && \
  rm -rf /var/lib/apt/lists/* && \
  sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
  echo "mysqld_safe &" > /tmp/config && \
  echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config && \
  echo "mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION;'" >> /tmp/config && \
  bash /tmp/config && \
  rm -f /tmp/config

# Define mountable directories.
VOLUME ["/etc/mysql", "/var/lib/mysql"]
# Define working directory.
WORKDIR /data

# Expose ports.
EXPOSE 3306

## mongodb
RUN rm -rf /var/lib/apt/lists/*
# Define mountable directories.
VOLUME ["/data/db"]
# Define working directory.
WORKDIR /data

# Expose ports.
#   - 27017: process
#   - 28017: http
EXPOSE 27017
EXPOSE 28017

RUN rm -rf /var/lib/apt/lists/*

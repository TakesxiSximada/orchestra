# -*- coding: utf-8 -*-
FROM ubuntu:latest
MAINTAINER TakesxiSximada @TakesxiSximada

# INSTALL
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y byobu curl git htop man unzip vim wget && \


RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/mainline/debian/ wheezy nginx" >> /etc/apt/sources.list

######################
## create local user
######################
RUN useradd sximada

######################
## default tools
######################


######################
## supervisor
######################
RUN apt-get install -y supervisord

######################
## Emacs
######################
RUN apt-get install -y emacs

######################
## tmux
######################
RUN apt-get install -y tmux

######################
## anyenv
######################


######################
## s3cmd
######################

######################
## aws-cli
######################


######################
## nginx
######################
ENV NGINX_VERSION 1.7.7-1~wheezy
RUN apt-get update && apt-get install -y nginx=${NGINX_VERSION}
# RUN ln -sf /dev/stdout /var/log/nginx/access.log
# RUN ln -sf /dev/stderr /var/log/nginx/error.log
VOLUME ["/var/cache/nginx"]
EXPOSE 80 443
# CMD ["nginx", "-g", "daemon off;"]
RUN nginx -g


######################
## fluentd
######################
RUN \
    apt-add-repository -y 'deb http://packages.treasure-data.com/debian/ lucid contrib' && \
    apt-get update && \
    apt-get install -y td-agent && \
    echo
EXPOSE 8888
# CMD ["/etc/init.d/td-agent", "start;"]
RUN /etc/init.d/td-agent start


######################
## mariadb
######################
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0xcbcb082a1bb943db && \
  echo "deb http://mariadb.mirror.iweb.com/repo/10.0/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/mariadb.list && \
  apt-get update && \
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

# Define default command.
CMD ["mysqld_safe"]

# Expose ports.
EXPOSE 3306



######################
## mongodb
######################
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  rm -rf /var/lib/apt/lists/*

# Define mountable directories.
VOLUME ["/data/db"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["mongod"]

# Expose ports.
#   - 27017: process
#   - 28017: http
EXPOSE 27017
EXPOSE 28017


######################
## FINISH
######################
RUN rm -rf /var/lib/apt/lists/*
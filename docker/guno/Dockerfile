# -*- coding: utf-8 -*-
FROM ubuntu:latest
MAINTAINER TakesxiSximada @TakesxiSximada
RUN useradd sximada

# rubyインストールに必要なパッケージを用意
RUN apt-get update
RUN apt-get install -y --force-yes build-essential curl git zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev

# rbenv, ruby-buildをインストール
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN ./root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> .bashrc

# rubyインストール（バージョン指定は ruby-versions.txt に）
ENV CONFIGURE_OPTS --disable-install-doc
ADD ./ruby-versions.txt /root/ruby-versions.txt
RUN xargs -L 1 rbenv install < /root/ruby-versions.txt

# bundlerを各rubyに用意
RUN echo 'gem: --no-rdoc --no-ri' >> /.gemrc
RUN bash -l -c 'for v in $(cat /root/ruby-versions.txt); do rbenv global $v; gem install bundler; done'

# sqlite3をインストール
RUN apt-get install -y sqlite3 libsqlite3-dev

# Node.jsインストール
RUN apt-get install -y software-properties-common
RUN apt-get update
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y nodejs

# ssh準備
RUN mkdir /root/.ssh/

# private keyをコピー
ADD id_rsa_guno /root/.ssh/id_rsa

# known_hosts設定
RUN touch /root/.ssh/known_hosts
# Add bitbuckets key
RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts

# applicationが使用する3rd libのコンパイルに必要なpackageをインストール
RUN apt-get install -y redis-server

# これがないとmysql関連のライブラリがbuildできない
RUN apt-get install -y mysql-server
RUN apt-get install -y libmysqlclient-dev

# これらがないとRMagicがbuildできない
RUN apt-get install -y imagemagick
RUN apt-get install -y libmagickwand-dev

# railsアプリケーションをclone
# RUN mkdir -p /srv/www/
# RUN git clone REPOSITORY
# WORKDIR /srv/www/DIRECTORY

# railsのセットアップ
# RUN apt-get install -y sqlite-devel
# RUN bundle install --path vendor/bundle
# RUN bash -l -c 'sh bin/copy_config_files.sh'
# RUN bash -l -c 'bundle exec rake secret'

# # topic manage のdb をsetup
# RUN bash -l -c 'bundle exec rake db:create'
# RUN bash -l -c 'bundle exec rake db:migrate'
# RUN bash -l -c 'bundle exec rake db:seed'

# # テストデータ生成
# RUN bash -l -c 'bundle exec rake test_data:create'

# # articleのテストデータ生成
# RUN bash -l -c 'bundle exec rake test_article_data:create'

# # Mongo Setup
# RUN apt-get install -y mongo
# RUN apt-get install -y redis

# RUN bash -l -c 'redis-server'
# RUN bash -l -c 'bundle exec rake admin:assign'
# RUN bash -l -c 'bundle exec rails s'

# # ADD ./secrets.yml /var/www/rails/config/secrets.yml

# EXPOSE 3000
# CMD bash -l -c 'bundle exec rails s'

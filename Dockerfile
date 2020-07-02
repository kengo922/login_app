FROM ruby:2.7
# or latest
LABEL maintainer="kengo matsuno"

# nodejsとmysql-client (default-mysql-client) のインストール
RUN apt-get update -qq && apt-get install -y curl apt-transport-https wget nodejs default-mysql-client
RUN yum install -y mysql mysql-server
# Yarn のインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && apt-get install -y yarn

# vimのインストール(コンテナー内で使用するため)
RUN apt-get update && apt-get -y install vim

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

# webpacker の導入に必要なパッケージマネージャーyarnをインストールするため、2,3行目を記述
# MAINTAINER(作成者の名前)は現在使用不可のため、LABEL maintainer="maintainer@example.com"と指定する
# ENTRYPOINT	コンテナ実行時のコマンドを指定
# EXPOSE	指定ポートを開ける
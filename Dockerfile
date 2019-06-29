FROM ruby:2.6.3

WORKDIR /home
COPY . /home

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
apt-get install -y nodejs && apt-get update -qq

RUN apt-get update -qq && gem install bundle && bundle install

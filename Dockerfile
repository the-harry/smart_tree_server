FROM ruby:2.6.3

WORKDIR /home
COPY . /home

RUN apt-get update -qq && gem install bundle && bundle install

FROM ruby:2.6.3-stretch

RUN apt-get update &&\
    apt-get install -y nodejs build-essential libpq-dev postgresql-client

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
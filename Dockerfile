FROM ruby:3.1.2

WORKDIR myApplication

COPY . .

RUN bundle install

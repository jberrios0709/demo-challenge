FROM ruby:2.7.5
ENV APP_HOME /demo-challenge
WORKDIR /usr/src/demo-challenge
# Install dependencies
RUN apt-get update -qq

RUN ["gem", "install", "bundler:2.1.4"]
RUN ["gem", "install", "nokogiri", "--platform=ruby"]
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 3000
FROM ruby:2.3

RUN mkdir /knowledge_base_ms
WORKDIR /knowledge_base_ms

ADD Gemfile /knowledge_base_ms/Gemfile
ADD Gemfile.lock /knowledge_base_ms/Gemfile.lock

RUN bundle install
ADD . /knowledge_base_ms

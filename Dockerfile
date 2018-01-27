FROM ruby:2.4.1
LABEL maintainer="zulh@hellogold.com"

RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev postgresql-client-9.4 git --fix-missing --no-install-recommends

# Upgrade NodeJS and install Yarn
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - \
    && apt-get install -y nodejs \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y apt-transport-https yarn

ENV INSTALL_PATH /library
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH
COPY Gemfile Gemfile

RUN gem install bundler
RUN bundle install --jobs=4

COPY . .
RUN RAILS_ENV=production DB_ADAPTER=nulldb SECRET_TOKEN=xxx bundle exec rake assets:precompile

RUN gem install shutup
RUN chmod +x start-docker.sh

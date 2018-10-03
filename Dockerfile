FROM ruby:2.5.1-alpine
RUN apk -U add \
  build-base \
  mariadb-dev \
  sqlite-dev \
  nodejs \
  tzdata \
  vim \
  && rm -rf /var/cache/apk*
RUN gem install bundler
WORKDIR /myapp
COPY Gemfile* /myapp/
RUN bundle install

WORKDIR /myapp
COPY . /myapp/
CMD /bin/sh -c "rm -f /myapp/tmp/pids/server.pid && ./bin/rails server"

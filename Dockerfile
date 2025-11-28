# Small and reproducible
FROM ruby:3.3-alpine

# system deps for native gems
RUN apk add --no-cache build-base git libffi-dev

# app dir
WORKDIR /site

# use Bundler into vendor to avoid root gems
ENV BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

# only Gem files first for layer caching
COPY Gemfile Gemfile.lock ./
RUN bundle install

# default command can be overridden by docker-compose or `docker run`
CMD ["bundle", "exec", "jekyll", "serve", "--livereload", "--host", "0.0.0.0"]


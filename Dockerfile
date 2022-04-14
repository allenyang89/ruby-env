FROM bitnami/ruby:3.1.2

RUN apt-get update -qq\
    && apt-get install -y --no-install-recommends \
        build-essential \
        imagemagick \
        libpq-dev \
        default-libmysqlclient-dev \
        git \
    && apt-get clean -y \
    && apt-get autoremove -y \
    && echo "gem: --no-document" >> /etc/gemrc \
    && gem install bundler -N \
    && gem install pg -v '~> 1.1' \
    && gem install mysql2 -v '~> 0.5'


# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

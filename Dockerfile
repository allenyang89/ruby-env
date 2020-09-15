FROM bitnami/ruby:2.7.1-prod

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
    && gem install pg -v '>= 0.18 , < 2.0' \
    && gem install mysql2 -v '>= 0.4.4'


# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

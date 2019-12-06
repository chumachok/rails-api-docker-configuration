FROM ruby:2.6.5

WORKDIR /home/blog

RUN apt-get update && apt-get -y install cmake curl
RUN gem install bundler --version="2.0.2"
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install nodejs

# copy project
WORKDIR /home/blog
COPY Gemfile /home/blog/Gemfile
COPY Gemfile.lock /home/blog/Gemfile.lock
RUN bundle install
COPY . /home/blog

ENV PORT 3000
EXPOSE $PORT

COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

# start the main process
CMD /bin/bash -c "bundle exec rake db:reset && bundle exec bin/rails server -b 0.0.0.0 -p ${PORT}"


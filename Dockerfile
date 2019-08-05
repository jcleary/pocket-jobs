FROM ruby:2.6
RUN apt-get update -qq && \
  curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  apt-get install -y nodejs postgresql-client
RUN mkdir /pocket-jobs
WORKDIR /pocket-jobs
COPY Gemfile /pocket-jobs/Gemfile
COPY Gemfile.lock /pocket-jobs/Gemfile.lock
RUN bundle install
COPY . /pocket-jobs

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

FROM ruby:2.6
RUN apt update -qq && apt install -y nodejs postgresql-client
RUN mkdir /plume
WORKDIR /plume
COPY Gemfile /plume/Gemfile
COPY Gemfile.lock /plume/Gemfile.lock
RUN gem install bundler -v 2.0.1
RUN bundle install
COPY . /plume

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
# setup common aliases. PS: They only work from interactive shells
RUN echo 'alias rake rswag="rake rswag:specs:swaggerize"' >> ~/.bashrc
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0", "3000"]
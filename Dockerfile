FROM   ruby:3.2
EXPOSE 3000
RUN    bundle exec nanoc
CMD    bundle exec nanoc view
VOLUME output

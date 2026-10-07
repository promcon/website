FROM   ruby:3.2

# pygments.rb shells out to Python.
RUN    apt-get update \
       && apt-get install -y --no-install-recommends python3 \
       && rm -rf /var/lib/apt/lists/*

WORKDIR /site

COPY   Gemfile Gemfile.lock ./
RUN    bundle install

COPY   . .
RUN    bundle exec nanoc

EXPOSE 3000
# Mount the site source at /site for live rebuilds: nanoc view serves ./output.
CMD    ["bundle", "exec", "nanoc", "view", "--host", "0.0.0.0", "--port", "3000"]
VOLUME /site/output

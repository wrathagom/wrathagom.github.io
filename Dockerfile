FROM jekyll/jekyll:4

WORKDIR /srv/jekyll

COPY Gemfile Gemfile.lock* ./
RUN bundle install

CMD ["bundle", "exec", "jekyll", "serve", "--watch", "--force_polling", "--future", "--host", "0.0.0.0", "--livereload"]

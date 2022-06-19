FROM ruby:2.3.7
WORKDIR /lohono
COPY . /lohono
RUN bundle install
CMD ["/bin/sh", "-c", "rake db:migrate && rake db:seed && rails s -b 0.0.0.0"]

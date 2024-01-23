# Dockerfile

FROM ruby:latest

WORKDIR /app

COPY cli_tool.rb .

RUN gem install rest-client

CMD ["ruby", "cli_tool.rb"]

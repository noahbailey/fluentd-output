FROM ruby:2.7-buster

# => Install fluentd + plugins
RUN gem install fluentd                         -v 1.12.3 && \
    gem install fluent-plugin-kafka             -v 0.15.1 && \
    gem install fluent-plugin-elasticsearch     -v 4.1.2  && \
    gem install fluent-plugin-influxdb-v2       -v 1.5.0

RUN mkdir /fluentd 

COPY fluentd.conf /fluentd/fluentd.conf

# => Run stage
ENTRYPOINT exec fluentd -c /fluentd/fluentd.conf

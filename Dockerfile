FROM confluentinc/cp-kafka:4.1.0

COPY smart_run.sh /etc/confluent/docker/
RUN chmod ag+x /etc/confluent/docker/smart_run.sh

CMD ["/etc/confluent/docker/smart_run.sh"]
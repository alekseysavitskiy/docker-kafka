FROM confluentinc/cp-kafka:4.1.0
COPY templates/ /etc/confluent/docker/
COPY smart_run.sh /etc/confluent/docker/
RUN chmod ag+x /etc/confluent/docker/smart_run.sh
RUN curl -L -O https://raw.githubusercontent.com/prometheus/jmx_exporter/master/example_configs/kafka-0-8-2.yml
RUN curl -L -O https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.3.1/jmx_prometheus_javaagent-0.3.1.jar
CMD ["/etc/confluent/docker/smart_run.sh"]
FROM debezium/connect:0.10

# https://github.com/debezium/debezium-examples/blob/master/unwrap-smt/debezium-jdbc-es/Dockerfile

ENV KAFKA_CONNECT_JDBC_DIR=$KAFKA_CONNECT_PLUGINS_DIR/kafka-connect-jdbc \
    KAFKA_CONNECT_ES_DIR=$KAFKA_CONNECT_PLUGINS_DIR/kafka-connect-elasticsearch

# ENV KAFKA_CONNECT_S3_DIR=$KAFKA_CONNECT_PLUGINS_DIR/kafka-connect-s3

# Deploy PostgreSQL JDBC Driver
RUN cd /kafka/libs && curl -sO https://jdbc.postgresql.org/download/postgresql-42.1.4.jar

# Deploy Kafka Connect JDBC
RUN mkdir $KAFKA_CONNECT_JDBC_DIR && cd $KAFKA_CONNECT_JDBC_DIR &&\
	curl -sO http://packages.confluent.io/maven/io/confluent/kafka-connect-jdbc/5.1.2/kafka-connect-jdbc-5.1.2.jar

    # confluent-hub install --no-prompt confluentinc/kafka-connect-s3:latest

# Deploy Kafka Connect S3
# RUN mkdir $KAFKA_CONNECT_S3_DIR && cd $KAFKA_CONNECT_S3_DIR &&\
# 	curl -sO https://packages.confluent.io/maven/io/confluent/kafka-connect-s3/5.5.9/kafka-connect-s3-5.5.9.jar

    
    # confluent-hub install --no-prompt confluentinc/kafka-connect-s3:latest

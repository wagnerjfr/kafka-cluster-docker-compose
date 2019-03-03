FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y \
    default-jdk \
    wget \
    curl && \
    rm -rf /var/lib/apt/lists/*

ENV KAFKA_PATH=/usr/local/kafka

RUN wget https://www-us.apache.org/dist/kafka/2.1.1/kafka_2.11-2.1.1.tgz && \
    tar xzf kafka_2.11-2.1.1.tgz && \
    mv kafka_2.11-2.1.1 $KAFKA_PATH && \
    rm -rf kafka_2.11-2.1.1.tgz
    #sed -i s/localhost:2181/zookeeper:2181/g $KAFKA_PATH/config/server.properties
    #sed -i s/broker.id=0/broker.id=$BROKER_ID/g $KAFKA_PATH/config/server.properties

COPY scripts $KAFKA_PATH

WORKDIR $KAFKA_PATH

RUN chmod +x *.sh

EXPOSE 2181 9092
#!/bin/bash

sed -i s/localhost:2181/$ZOOKEEPER_HOST:$KAFKA_PORT/g config/server.properties
sed -i s/broker.id=0/broker.id=$BROKER_ID/g config/server.properties

bin/kafka-server-start.sh config/server.properties

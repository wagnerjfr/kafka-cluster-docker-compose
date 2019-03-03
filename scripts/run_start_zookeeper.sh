#!/bin/bash

sed -i s/localhost:2181/$ZOOKEEPER_HOST:$ZOOKEEPER_PORT/g config/server.properties

bin/zookeeper-server-start.sh config/zookeeper.properties

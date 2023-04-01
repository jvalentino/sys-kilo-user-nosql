#!/bin/sh
PORT=9043
NAME=cassandra_user_domain

mkdir build || true

kubectl port-forward --namespace default svc/$NAME $PORT:$PORT > build/$NAME.log 2>&1 &
echo "exit" | cqlsh -u cassandra -p cassandra

while [ $? -ne 0 ]; do
    kubectl port-forward --namespace default svc/$NAME $PORT:$PORT > build/$NAME.log 2>&1 &
    echo "exit" | cqlsh -u cassandra -p cassandra
    sleep 5
done

cqlsh -u cassandra -p cassandra -f changelog.cql


#!/bin/sh
helm repo add cassandra https://charts.bitnami.com/bitnami
helm delete cassandra_user_domain --wait || true
helm install cassandra_user_domain cassandra/cassandra \
	--wait \
	--set dbUser.user=cassandra \
	--set dbUser.password=cassandra

sh -x ./verify.sh
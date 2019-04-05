#!/bin/bash

source $1

if [ -z "$buildnumber" ] || [ -z "$urlpath" ]; then
    printf '{"failed": true, "msg": "Missing required argument(s)}'
    exit 1
fi

wget http://nexus-ci.playpit.by/repository/MNT-pipeline-training/fchkhaidze/pipeline-fchkhaidze/$buildnumber/pipeline-fchkhaidze-$buildnumber.tar.gz -P /tmp

tar xvzf /tmp/pipeline-fchkhaidze-$buildnumber.tar.gz -C /tmp/

curl -T '/tmp/helloworld-ws/target/helloworld-ws.war' "http://admin:admin@192.168.56.113:8080/manager/text/deploy?path=/$urlpath&tag=$buildnumber&update=true"

curl -IL 'http://192.168.56.113:8080/urlpath' > /tmp/response

PREVBUILD=$(cat /tmp/currentbuildnumber)

if grep -q 404 /tmp/response
  then wget -O /tmp/pipeline-fchkhaidze-$PREVBUILD.tar.gz  http://nexus-ci.playpit.by/repository/MNT-pipeline-training/fchkhaidze/pipeline-fchkhaidze/$PREVBUILD/pipeline-fchkhaidze-$PREVBUILD.tar.gz -P /tmp
  tar xvzf /tmp/pipeline-fchkhaidze-$PREVBUILD.tar.gz -C /tmp/
  curl -T '/tmp/helloworld-ws/target/helloworld-ws.war' "http://admin:admin@192.168.56.113:8080/manager/text/deploy?path=/$urlpath&tag=$PREVBUILD&update=true"
else
  echo "ok"
fi

exit 0

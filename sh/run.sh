#!/bin/bash
CUR_DIR="${pwd}"
myv=`timeout 180s curl -s http://localhost:3002/blazegraph/sparql?query=SELECT%20%3Fs%20%7B%3Fs%20%3Fp%20%3Fo%7D%20LIMIT%201`

if [ -z "$myv" ] || [[ $myv != *"results"* ]];
then
    ./stop.sh
    sleep 2
    cd ..
    nohup java -server -Xmx4G -Dbigdata.propertyFile=ccc.properties -Djetty.port=3002 -Djetty.host=127.0.0.1 -jar blazegraph.jar &
    cd $CUR_DIR
    exit 0
fi

cd $CUR_DIR
exit 1

#!/bin/bash
ps -ef | grep "Djetty.port=3002.*[b]lazegraph" | awk '{print $2}' | xargs kill -9
exit 0

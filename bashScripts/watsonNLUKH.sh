#!/bin/bash

curl -X POST -d "url=$1&format=json" "http://khss-php.mybluemix.net"
#curl "http://$1"

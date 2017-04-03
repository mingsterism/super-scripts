#!/bin/bash

cd lambda
zip -X -r ../index.zip . -i *
cd ..

aws lambda create-function \
	--function-name "$1" \
	--runtime "$3" --role "arn:aws:iam::113838824609:role/service-role/myBasicExecutionRole" \
	--handler "$1.$2" \
	--zip-file fileb://index.zip


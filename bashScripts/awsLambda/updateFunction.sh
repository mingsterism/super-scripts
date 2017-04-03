#!/bin/bash
file="index.zip"
if [ -e "$file" ]
then
	if [ "$1" ]
	then 
		rm -rf index.zip
		cd lambda
		zip -X -r ../index.zip . -i *
		cd ..
		aws lambda update-function-code --function-name "$1" --zip-file fileb://index.zip
	else 
		echo "Commannd was not found. Enter a command"
	fi
else 
	echo "$file not found"
fi


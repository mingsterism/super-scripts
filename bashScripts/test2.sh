#!/bin/bash

usage="$(basename "$FUNCNAME") and -t and -r and -p"
while getopts “ht:r:p:v” OPTION
do
     case $OPTION in
         h)
             "$usage"
             exit 1
             ;;
         t)
             TEST=$OPTARG
             ;;
         r)
             SERVER=$OPTARG
             ;;
         p)
             PASSWD=$OPTARG
             ;;
         v)
             VERBOSE=1
             ;;
         ?)
             usage
             exit
             ;;
     esac
done

if [[ -z $TEST ]] && [[ -z $SERVER ]] && [[ -z $PASSWD ]]
then
     "$usage"
     echo "hello by friends"
     echo "$TEST and $SERVER and $PASSWD"
     exit 1
else
	echo "noooooooooooo"
fi
echo "helllllllllllo"


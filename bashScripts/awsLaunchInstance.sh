#!/bin/bash
usage="$(basename "$FUNCNAME") [-h] [-c n] -- to launch an AWS Spot Instance 
    		-h  show this help text"

SERVER= 
if [[ $# -eq 0 ]]; then echo "$usage"
	exit 0
fi

while getopts ':hc:' option; do
	case "$option" in 
		h) echo "$usage"
			exit
			;;
		c) SERVER=$OPTARG
			echo "server count initialized"
			;;
		:) printf "missing argument for -%s\n" "$OPTARG" >&2
			echo "$usage" >&2
			exit 1
			;;
		\?) printf "illegal option -%s\n" "$OPTARG" >&2
			echo "$usage" >&2
			exit 1
			;;
	esac
done
shift $((OPTIND - 1))

if [ -z $SERVER ]; then
	echo "$usage"
else
	aws ec2 run-instances --image-id ami-03a31060 --count $SERVER --instance-type t2.micro --key-name aws03 --security-groups dockerEC
fi

#!/bin/bash
aws ec2 run-instances --image-id ami-03a31060 --count 1 --instance-type t2.micro --key-name keypair1 --security-groups dockerEC

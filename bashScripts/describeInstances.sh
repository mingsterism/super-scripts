#!/bin/bash

aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId, State.Name, Placement.AvailabilityZone, PublicIpAddress]' --output text


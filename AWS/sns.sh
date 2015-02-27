#!/bin/bash


# Set TOPIC
SNS_TOPIC="arn:aws:sns:eu-west-1:<client>:<topic>"

# List AS_GROUPS
#as-describe-auto-scaling-groups |awk '/stack-name/ { print $2}'

# Set our new one
AS_GROUP="<AS_ID>"

# Configure notification
aws autoscaling put-notification-configuration --auto-scaling-group-name $AS_GROUP --topic-arn $SNS_TOPIC --notification-types autoscaling:EC2_INSTANCE_LAUNCH autoscaling:EC2_INSTANCE_TERMINATE
# Describe
#as-describe-notification-configurations

# O tambien con el siguiente comando de CLI3
aws autoscaling describe-notification-configurations --auto-scaling-group-name $AS_GROUP


aws sns subscribe --topic-arn $SNS_TOPIC --protocol email --notification-endpoint <email>
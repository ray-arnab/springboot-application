#!/bin/bash

# AWS access setup - corresponding user should have AmazonEC2ContainerServiceforEC2Role role as well
#export AWS_ACCESS_KEY_ID=<>
#export AWS_SECRET_ACCESS_KEY=<>

#ecs-cli configure profile --profile-name admin

# configure - do not use underscores in cluster name
ecs-cli configure --cluster sb-demo-cluster --default-launch-type EC2 --region us-east-2 --config-name sb-demo-config

# setup cloud formation template
ecs-cli up --force --keypair ecs --capability-iam --size 2 --instance-type t2.micro --cluster sb-demo-cluster

# deploy
ecs-cli compose --debug --cluster sb-demo-cluster --ecs-params=ecs-params.yml up

# check
ecs-cli ps --cluster sb-demo-cluster
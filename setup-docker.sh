#!/bin/bash

# build the containers
docker build -t rayarnab82/springboot-demo:latest ./springboot-demo
docker build -t rayarnab82/springboot-oauth-demo:latest ./springboot-oauth-authzserver

# create the network
docker network create springboot-network

# set some env vars
export SB_SERVER="$(docker-machine ip default)"
echo $SB_SERVER
export SB_PROFILE=dev
echo $SB_PROFILE
export SB_TOKEN_URL=http://$SB_SERVER:8081/auth/oauth/token
echo $SB_TOKEN_URL
export SB_USER_URI=http://$SB_SERVER:8081/auth/user
echo $SB_USER_URI

# start the containers
docker run -d --net springboot-network -p 8081:8081 --rm --name springboot-oauth-demo rayarnab82/springboot-oauth-demo:latest
docker run -d -e spring.profiles.active=$SB_PROFILE -e oauth.token.url=$SB_TOKEN_URL -e security.oauth2.resource.userInfoUri=$SB_USER_URI --net springboot-network -p 8080:8080 --rm --name springboot-demo rayarnab82/springboot-demo:latest

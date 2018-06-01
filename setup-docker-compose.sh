#!/bin/bash

# build and start containers
docker-compose up -d --build


# optional : check for interconnectivity
#docker-compose exec springboot-demo bash
#curl -X POST client2:password2@springboot-oauth-demo:8081/auth/oauth/token -d grant_type=client_credentials


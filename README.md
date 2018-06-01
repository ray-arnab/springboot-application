# Springboots parent application


##1. setup-docker.sh
	- Set of commands to run the two containers in docker without docker-compose
	- Access application as: http://192.168.99.100:8080/api/v1/client/lookup.html (replace ip with what's shown on <pre>docker-machine ip default</pre>)
	
	
##2. setup-docker-compose.sh
	-Set of commands to run the two containers with docker-compose
	
	- 2.a. docker-compose.yml : The docker-compose file
	- 2.b. .env : Environment variable for the compose file
	- 2.c. springboot-demo.env : Environment variable specifially for the springboot-demo application
	
	- Note: 
		- a) The compose file also sets env variable from within the yml file. This is just to explore the various ways of passing env variables.
		- b) The compose file uses port 80 instead of 8080 for the springboot-demo app.
		
	- Access application as: http://192.168.99.100/api/v1/client/lookup.html (replace ip with what's shown on <pre>docker-machine ip default</pre>)
	
	
##3. Dockerrun.aws.json
	
	-Used to deploy the two contaners in AWS Elastic Beanstalk (EB)
	-aws-eb-1.1.zip (Dockerrun.aws.json + .ebextensions/.config): Alternative way of packaging the json with environment variables externalized in a different file
	-Access application as: http://<IP>/api/v1/client/lookup.html (replace <IP> with what's applicable from AWS)
	

##4. setup-aws-ecs.sh

	- Set of commands to deploy in AWS ECS
	- 4.a. ecs-params.yml : Used in conjunction with docker-compose to deploy the two containers in AWS Elastic Container Service (ECS)
	- Access application as: http://<IP>/api/v1/client/lookup.html (replace <IP> with what's shown for  "ecs-cli ps --cluster sb-demo-cluster")
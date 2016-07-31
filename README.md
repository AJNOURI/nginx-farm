# Nginx server farm using Docker-in-Docker


Originally forked from [https://github.com/jpetazzo/dind](https://github.com/jpetazzo/dind) 

--------------

Requires **--privileged** option 
Use with caution!  
For more inf. look here: https://docs.docker.com/engine/reference/run/#/runtime-privilege-and-linux-capabilities  

--------------
#### Instructions

Run a Docker in Docker container:  

	docker run --privileged -t -i --hostname dind ajnouri/nginx-farm

From inside Dind container, start n number of containers

	./startfarm.sh <n>

The first time docker will pull nginx image and spawn n containers from  

Get nginx server IPs:  

	id=$(docker ps | grep dind --format "{{.ID}}"
       
	docker inspect -f '{{ .NetworkSettings.IPAddress }}' $id  
	



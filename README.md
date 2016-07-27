# Nginx server farm using Docker-in-Docker

Clone the image

	docker pull ajnouri/dind:1.0  

Run a Docker in Docker container:  

	docker run --privileged -t -i --hostname dind ajnouri/dind   

From inside Dind container, start n number of containers

	./startfarm.sh <n>

The first time docker will pull nginx image and spawn n containers from  

Get nginx server IPs:  

	id=$(docker ps | grep dind --format "{{.ID}}"
       
	docker inspect -f '{{ .NetworkSettings.IPAddress }}' $id  
	



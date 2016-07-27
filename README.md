# Docker-in-Docker

Clone the image
> docker pull ajnouri/dind:1.0  

Run a Docker in Docker container:  
> docker run --privileged -t -i --hostname dind ajnouri/dind   

Get its IP:  
> id=$(docker ps | grep dind --format "{{.ID}}"    
> docker inspect -f '{{ .NetworkSettings.IPAddress }}' $id  




#!/bin/bash
# AJN: ajn.bin@gmail.com

daemon=`cat /var/run/docker.pid 2> /dev/null`
if [ -z "$daemon" ]; then
    echo "Docker daemon not running" >&2
    service docker start
else
    echo "Docker daemon running"
fi

warn () {
    echo "$@" >&2
}

die () {
    status="$1"
    shift
    warn "$@"
    exit "$status"
}

if [ "$#" -eq 0 ]; then
  echo ""
  echo -e "Usage: $0 <nbr-of-containers> \n" >&2
  echo ""
  die 1
fi

ITAG="ajnouri/nginx"
CNAMES="nginx-"
echo "Number of containers = $2"

for (( i=1; i<=$1; i=i+1 ))
    do
        echo -e "\nServer $CNAMES $i starting...\n"
        #echo "sudo docker run -tid --hostname $CNAMES$i --name $CNAMES$i $ITAG /bin/bash"
        sudo docker run -tid --hostname $CNAMES$i --name $CNAMES$i $ITAG /bin/bash
        sleep 2
        CID="$(sudo docker ps | grep $CNAMES$i | awk '{ print $1; }')"
	echo "$CID \n"
	#docker exec $CID service nginx start&
	#docker exec $CID service php5-fpm start&
    done


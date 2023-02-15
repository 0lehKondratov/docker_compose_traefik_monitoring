#!/bin/bash
#volumes:
#    cmdbuild-db:
#      external: true
##      driver:   local
#    cmdbuild-tomcat:
#      external: true
#      driver:   local
#    prometheus-data:
#      external: true
#    pgadmin-data:
#      external: true
#      driver:   local
#    grafana-data:
#      external: true
#      driver:   local

mkdir -p /opt/dctr1/cmdbuild-db
mkdir -p /opt/dctr1/cmdbuild-tomcat
mkdir -p /opt/dctr1/pgadmin-data
mkdir -p /opt/dctr1/grafana-data
mkdir -p /opt/dctr1/prometheus-data

docker rm $(docker ps -a -f status=exited -q)
docker rmi $(docker images -a -q)
docker volume prune -f
docker network prune -f
docker volume rm $(docker volume ls -qf dangling=true)
echo
echo "local images"
docker images
echo
echo "all containers"
docker ps -a
echo 
echo "all volumes"
docker volume ls
echo 
echo " all networks"
docker network ls
#docker volume create --opt type=none --opt o=bind --driver local --opt device=/opt/dctr1/cmdbuild-db cmdbuild-db
#docker volume create --opt type=none --opt o=bind --driver local --opt device=/opt/dctr1/cmdbuild-tomcat cmdbuild-tomcat
#docker volume create --opt type=none --opt o=bind --driver local --opt device=/opt/dctr1/pgadmin-data pgadmin-data
#docker volume create --opt type=none --opt o=bind --driver local --opt device=/opt/dctr1/grafana-data grafana-data
#docker volume create --opt type=none --opt o=bind --driver local --opt device=/opt/dctr1/prometheus-data prometheus-data

### Application monitoring with Traefik, Prometheus, Grafana, and Docker Compose 
```
mkdir -p /opt/dctr1/cmdbuild-db
mkdir -p /opt/dctr1/cmdbuild-tomcat
mkdir -p ./backup
mkdir -p /opt/dctr1/pgadmin-data
mkdir -p ./grafana-cfg
mkdir -p /opt/dctr1/grafana-data
mkdir -p /opt/dctr1/prometheus-data
mkdir -p ./prometheus-cfg
mkdir -p /opt/dctr1/geo-data
mkdir -p /opt/dctr1/geo-logs
mkdir -p /opt/dctr1/bimv-data
mkdir -p /opt/dctr1/shark-logs
mkdir -p /opt/dctr1/shark-tomcat
```

```
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
```

### Create volume

```
docker volume create --opt type=none --opt o=bind --driver local --opt device=/opt/dctr1/cmdbuild-db cmdbuild-db
docker volume create --opt type=none --opt o=bind --driver local --opt device=./cmdbuild-backup cmdbuild-backup
docker volume create --opt type=none --opt o=bind --driver local --opt device=/opt/dctr1/cmdbuild-tomcat cmdbuild-tomcat

docker volume create --opt type=none --opt o=bind --driver local --opt device=/opt/dctr1/pgadmin-data pgadmin-data
docker volume create --opt type=none --opt o=bind --driver local --opt device=./grafana-cfg grafana-cfg
docker volume create --opt type=none --opt o=bind --driver local --opt device=/opt/dctr1/grafana-data grafana-data
docker volume create --opt type=none --opt o=bind --driver local --opt device=./prometheus-cfg prometheus-cfg
docker volume create --opt type=none --opt o=bind --driver local --opt device=/opt/dctr1/prometheus-data prometheus-data
docker volume create --opt type=none --opt o=bind --driver local --opt device=/opt/dctr1/geo-data geo-data
docker volume create --opt type=none --opt o=bind --driver local --opt device=/opt/dctr1/geo-logs geo-logs
docker volume create --opt type=none --opt o=bind --driver local --opt device=/opt/dctr1/bimv-data bimv-data
docker volume create --opt type=none --opt o=bind --driver local --opt device=/opt/dctr1/shark-logs shark-logs
docker volume create --opt type=none --opt o=bind --driver local --opt device=/opt/dctr1/shark-tomcat shark-tomcat
```

 docker compose --env-file .env.dev -f infrastructure.yml up

```
pg_dump --host localhost --port 5432 --username "postgres" --format custom --verbose --file ./cmdbuild.backup cmdbuild_db
bash webapps/cmdbuild.sh dbconfig recreate ./cmdbuild.backup 
```
### Techical manual page 24 
https://issuu.com/tecnoteca/docs/technicalmanual_eng_v150
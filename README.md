![Scheme](/scheme.png)

# Application monitoring with Traefik, Prometheus, Grafana, and Docker Compose for beginners

This is my vision of a simple monitoring infrastructure.
Simple startup:

```
docker-compose --env-file .env.dev -f infrastructure.yml up -d
docker-compose --env-file .env.dev -f example-backend.yml up -d
```

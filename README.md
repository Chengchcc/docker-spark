# docker-spark

## Build

```bash
 docker build  . -t docker-dev:v1

```

## start

```bash
 docker run  -p 9092:9092 -p 8080:8080 -p 7070:7070 -p:8081:8081 --hostname  -itd docker-spark:v1
```

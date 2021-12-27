# RTSP MongoDB Shell Docker Image

Debian with [MongoDB Shell (mongosh)](https://docs.mongodb.com/mongodb-shell/) included.


## `mongosh` Usage

For the `mongosh` command usage, please refer to the following documents.

- [Connect to a Deployment](https://docs.mongodb.com/mongodb-shell/connect/)
- [`mongosh` Usage](https://docs.mongodb.com/mongodb-shell/run-commands/)
  - [Perform CRUD Operations](https://docs.mongodb.com/mongodb-shell/crud/)
  - [Run Aggregation Pipelines](https://docs.mongodb.com/mongodb-shell/run-agg-pipelines/)
- [`mongosh` Options](https://docs.mongodb.com/mongodb-shell/reference/options/)


## Usage

In order to use image from GitHub Container Registry instead of Docker Hub, you can replace `rtsp/mongosh` with `ghcr.io/rtsp/docker-mongosh` anywhere in the instruction below.

### Pull Image

```ShellSession
docker pull rtsp/mongosh
```

### Interactive Mode

```ShellSession
docker run --rm -it rtsp/mongosh mongosh -- mongodb://172.17.0.1:27017
```

```ShellSession
docker run --rm -it rtsp/mongosh bash
```

### Run a Specific Command

```ShellSession
docker run --rm rtsp/mongosh mongosh -- mongodb://172.17.0.1:27017 --eval 'db.serverStatus()'
```

### Run as Daemon

```ShellSession
docker run -d --name mongosh rtsp/mongosh
```

```ShellSession
docker exec mongosh mongosh -- mongodb://172.17.0.1:27017 --eval 'db.serverStatus()'

docker exec -it mongosh mongosh -- mongodb://172.17.0.1:27017

docker exec -it mongosh bash
```

### Run as Kubernetes Pod

```yaml
---
apiVersion: v1
kind: Pod
metadata:
  name: mongosh
spec:
  containers:
  - name: mongosh
    image: rtsp/mongosh:latest
```

```ShellSession
kubectl exec mongosh -- mongosh mongodb://ENDPOINT:27017 --eval 'db.serverStatus()'

kubectl exec -it mongosh -- mongosh mongodb://ENDPOINT:27017

kubectl exec -it mongosh -- bash
```

### Run as Kubernetes Deployment

```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongosh
spec:
  replicas: 1
  selector:
    matchLabels:
      name: mongosh
  template:
    metadata:
      labels:
        name: mongosh
    spec:
      containers:
        - name: mongosh
          image: rtsp/mongosh:latest
          imagePullPolicy: Always
```

```ShellSession
kubectl exec deployment/mongosh -- mongosh mongodb://ENDPOINT:27017 --eval 'db.serverStatus()'

kubectl exec -it deployment/mongosh -- mongosh mongodb://ENDPOINT:27017

kubectl exec -it deployment/mongosh -- bash
```



## Links

### Packages

- Docker Hub: [rtsp/mongosh](https://hub.docker.com/r/rtsp/mongosh/)
- GitHub: [ghcr.io/rtsp/docker-mongosh](https://github.com/rtsp/docker-mongosh/pkgs/container/docker-mongosh)

### Source Code

- [rtsp/docker-mongosh](https://github.com/rtsp/docker-mongosh)

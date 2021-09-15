# RTSP MongoDB Shell Docker Image

Debian with [MongoDB Shell](https://docs.mongodb.com/mongodb-shell/) included.


## Usage

In order to use image from GitHub Container Registry instead of Docker Hub, you can replace `rtsp/mongosh` with `ghcr.io/rtsp/docker-mongosh` anywhere in the instruction below.

### Pull Image

```ShellSession
docker pull rtsp/mongosh
```

### Run Once

```ShellSession
docker run --rm -it rtsp/mongosh mongosh -- mongodb://172.17.0.1:27017
```

### Run as Daemon

```ShellSession
docker run -d --name mongosh rtsp/mongosh
docker exec -it mongosh mongosh -- mongodb://172.17.0.1:27017
```


### Kubernetes

#### Pod

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
kubectl exec -it mongosh -- mongosh mongodb://ENDPOINT:27017
```

#### DaemonSet

```yaml
---
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: mongosh
spec:
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
          imagePullPolicy: IfNotPresent
      terminationGracePeriodSeconds: 30
```

```ShellSession
kubectl exec -it mongosh-XXXXXX -- mongosh mongodb://ENDPOINT:27017
```


## Links

### Packages

- Docker Hub: [rtsp/mongosh](https://hub.docker.com/r/rtsp/mongosh/)
- GitHub: [ghcr.io/rtsp/docker-mongosh](https://github.com/rtsp/docker-mongosh/pkgs/container/docker-mongosh)

### Source Code

- [rtsp/docker-mongosh](https://github.com/rtsp/docker-mongosh)

# RTSP MongoDB Shell Docker Image

Debian with MongoDB Shell included.


## Usage


### Run Once

```ShellSession
docker run --rm -it rtsp/mongosh bash
```


### Run as Daemon

```ShellSession
docker run -d --name rtsp-mongosh rtsp/mongosh
docker exec -it rtsp-mongosh bash
```


### Kubernetes Pod

```ShellSession
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: mongosh
spec:
  containers:
  - name: mongosh
    image: rtsp/mongosh:latest
EOF
kubectl exec -it mongosh -- bash
```


## Links

- [Docker Hub: rtsp/mongosh](https://hub.docker.com/r/rtsp/mongosh/)
- [GitHub: rtsp/docker-mongosh](https://github.com/rtsp/docker-mongosh)

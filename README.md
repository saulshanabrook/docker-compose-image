# docker-compose-image
This is based off of the [official Docker image](https://hub.docker.com/_/docker/)
and adds enough for Gitlab CI builds (primarily Docker Compose).

```bash
docker run --privileged --name some-docker -d docker:1.9-dind
docker run --rm --link some-docker:docker quay.io/saulshanabrook/docker-compose docker-compose version
```

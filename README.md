# docker-compose-image
This is based off of the [official Docker image](https://hub.docker.com/_/docker/)
and adds enough for Gitlab CI builds (primarily Docker Compose).

```bash
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock quay.io/saulshanabrook/docker-compose docker-compose version
```

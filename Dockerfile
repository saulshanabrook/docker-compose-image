FROM docker:1.9-git

RUN apk add --update \
		py-pip \
		bash \
		jq \
		ruby \
	&& rm -rf /var/cache/apk/*
RUN pip install docker-compose
RUN gem install --no-doc dpl

# keep original entrypoint at /usr/local/bin/docker-entrypoint.sh
# so we can call it
ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint2.sh
# /usr/local/bin comes before /usr/bin in the path, so this docker-compose
# will get picked up before the real one at /usr/bin/docker-compose
# so we can control it's project name automatically. We want to set this
# to something specific to this container, so that it differs between
# different Gitlab CI builds of the same project.
ADD docker-compose.sh /usr/local/bin/docker-compose


ENV DOCKER_CLIENT_TIMEOUT 600

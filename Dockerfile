FROM docker:1.9-git

RUN apk add --update \
		py-pip \
		bash \
		jq \
		ruby \
    perl \
	&& rm -rf /var/cache/apk/*
RUN pip install docker-compose
RUN gem install --no-doc dpl

ENV DOCKER_HOST tcp://docker:2375

ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

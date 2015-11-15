FROM docker:1.9-git

RUN apk add --update \
		py-pip \
		bash \
		jq \ 
		ruby \
	&& rm -rf /var/cache/apk/*
RUN pip install docker-compose
RUN gem install --no-doc dpl

ENV DOCKER_CLIENT_TIMEOUT 600

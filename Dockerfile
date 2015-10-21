FROM docker:1.8

RUN apk add --update \
		py-pip \
	&& rm -rf /var/cache/apk/*
RUN pip install docker-compose

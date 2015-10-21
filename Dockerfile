FROM docker:1.8-git

RUN apk add --update \
		py-pip \
		bash \
	&& rm -rf /var/cache/apk/*
RUN pip install docker-compose

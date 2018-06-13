FROM ubuntu:18.04

LABEL MAINTAINER=coen.vanleeuwen@tno.nl

WORKDIR /gitbook

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends npm calibre ca-certificates && \ 
    npm install gitbook-cli -g && \
    gitbook fetch 

RUN npm cache clear && \
    apt-get purge -y npm python3 python3.6 && \ 
    apt-get -y autoremove && \
    rm -rf /tmp/*
    
RUN apt-get install -y nodejs

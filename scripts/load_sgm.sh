#!/bin/sh
docker run -d --name SGMbroker -p 1883:1883 -v /var/log sgm-broker && \
docker run -d --name SGMdash-stage  --link SGMbroker:broker -v /var/log sgmeteo/sgm-dash:staging && \
docker run -d --name SGMdash-prod   --link SGMbroker:broker -v /var/log sgmeteo/sgm-dash:production && \ 
docker run -d --name SGMnginx -p 80:80 -p 443:443 --link c9:c9 --link SGMdash-stage:SGMdash-stage --link SGMdash-prod:SGMdash-prod -v /var/log sgmeteo/sgm-nginx:latest


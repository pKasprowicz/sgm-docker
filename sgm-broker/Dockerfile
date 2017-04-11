FROM mhart/alpine-node
MAINTAINER Piotr Kasprowicz

ENV DEBIAN_FRONTEND noninteractive

EXPOSE 1883
EXPOSE 25603

RUN apk update && apk add git unzip python g++ make libzmq krb5-dev

RUN ln -s `which nodejs` /usr/bin/node

RUN npm install pm2 -g

WORKDIR /var/git

RUN git clone https://github.com/pKasprowicz/sgm-dashboard.git -b master

WORKDIR sgm-dashboard/sgm-broker
RUN npm install && npm install ../sgm-common

WORKDIR ../

CMD ["pm2-docker", "./ecosystem.json", "--only", "SGMbroker", "--env", "echo ${SGM_RUNMODE}"]

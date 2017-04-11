docker stop SGMdash-stage && \
docker rm SGMdash-stage && \
docker rmi sgmeteo/sgm-dash:staging && \
docker build -f ./Dockerfile.staging -t sgmeteo/sgm-dash:staging . && \
docker run -d --name SGMdash-stage --link SGMbroker:broker -v /var/log sgmeteo/sgm-dash:staging
docker run -d --name SGMnginx -p 80:80 -p 443:443 --link c9:c9 --link SGMdash-stage:SGMdash-stage --link SGMdash-prod:SGMdash-prod -v /var/log sgmeteo/sgm-nginx:latest
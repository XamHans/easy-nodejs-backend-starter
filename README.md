# docker-nginx-node

A docker-compose project with these servers:
  * webserver -- an nginx reverse proxy HTTPS server
  * newdevsontheblock -- a node express webserver for the domain newdevsontheblock.com (change to your own domain name)
  * certbot -- the certbot utility, which talks to [letsencrypt.org](https://letsencrypt.org) to automate the process of obtaining and renewing HTTPS certificates
  


#How to start 
1) Setup an A Record on your DNS Provider to point to your server ip, wait till DNS propagation is done, in my case it was strapi.newdevsontheblock.com --> XXXX.XXX.XXX

2) Change all domain occurens to your domain (if in vscode shift+strg+F to find and replace all)

3) in the nignx config remove the server https part (starts with 
```server {
        listen 443 ssl http2;
        ....
        }
```
! because we need dont have the certificates yet

4) once you have removed the https part you can start docker-compose up --> certbot is now starting a challenge and is trying to challenge your nginx webserver. The certification should now be created and available to the nginx container through the shared volumes ( have a look at the certbot section in the docker-compose.yaml --> 
       - certbot-etc:/etc/letsencrypt
      - certbot-var:/var/lib/letsencrypt)
      )

4.1) create your own TLS certificate --> `mkdir dhparam`, and 
       sudo openssl dhparam -out ./dhparam/dhparam-2048.pem 2048

5) go back to the nginx.conf file and paste in the early removed https server section

6) start docker-compose up --build again, nginx should find the certifications and is able to your nodeJS with HTTPS

enjoy your local setup 🍸 - Best wishes - Xamhans

Thanks to jklemke for the repo that I have been using as a template (https://github.com/jklemke/docker-nginx-node)
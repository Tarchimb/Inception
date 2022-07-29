#!/bin/bash
mkdir /certs; cp /etc/certs/fullchain.pem /certs/certificat.crt
nginx -g "daemon off;"
# openssl x509 -outform pem -in /etc/certs/fullchain.pem -out certs/certificat
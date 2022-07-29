#!/bin/bash
nginx -g "daemon off;"
mkdir /certs
openssl x509 -outform pem -in /etc/certs/fullchain.pem -out certs/certificat
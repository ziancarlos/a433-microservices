#!/bin/sh
# Perintah untuk membuat Docker image dari Dockerfile yang tadi dibuat
docker build -t order-service:latest .

# Melihat daftar image di lokal.
docker image ls -a

# Mengubah nama image agar sesuai dengan format GitHub Packages 
docker tag order-service:latest ghcr.io/ziancarlos/order-service:latest

# Login ke GitHub Packages  via Terminal.
echo $CR_PAT | docker login ghcr.io -u ziancarlos --password-stdin ghcr.io

# Mengunggah image ke GitHub Packages
docker push ghcr.io/ziancarlos/order-service:latest
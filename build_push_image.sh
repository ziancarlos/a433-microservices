#!/bin/sh
#Perintah untuk membuat Docker image dari Dockerfile yang tadi dibuat, dengan nama image item-app, dan memiliki tag v1.
docker build -t item-app:v1 -f Dockerfile .

#Melihat daftar image di lokal.
docker image ls -a

#Mengubah nama image agar sesuai dengan format Docker Hub (atau GitHub Packages bila menerapkan saran keempat).
docker tag item-app:v1 ghcr.io/ziancarlos/item-app:v1

#Login ke Docker Hub (atau GitHub Packages bila menerapkan saran keempat) via Terminal.
echo $CR_PAT | docker login ghcr.io -u ziancarlos --password-stdin ghcr.io

#Mengunggah image ke Docker Hub (atau GitHub Packages bila menerapkan saran keempat).
docker push ghcr.io/ziancarlos/item-app:v1
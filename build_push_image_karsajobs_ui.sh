#!/bin/sh

# Perintah untuk membuat Docker image dari Dockerfile yang tadi dibuat, dengan nama image item-app, dan memiliki tag v1.
docker build -t ghcr.io/ziancarlos/karsajobs-ui:latest -f Dockerfile .
# Login ke Docker Hub (atau GitHub Packages bila menerapkan saran keempat) via Terminal.
echo $CR_PAT | docker login ghcr.io -u ziancarlos --password-stdin ghcr.io
# Mengunggah image ke Docker Hub (atau GitHub Packages bila menerapkan saran keempat).
docker push ghcr.io/ziancarlos/karsajobs-ui:lates
# #Three Tiers Webapp

## Overview
An example three ties webapp with a MongoDB backend. 
It includes Dockerfiles and k8s deployment files

## Application Code
The `Application-Code` directory contains the source code for the Three-Tier Web Application.

## Kubernetes Manifests Files
The `Kubernetes-Manifests-Files` directory holds Kubernetes manifests for deploying your application

### Step 1: EC2 Setup
- Launch an Ubuntu instance in your favourite region (eg. region `us-central`).
- SSH into the instance from your local machine.

### Step 2: Install Docker
``` shell
sudo apt-get update
sudo apt install docker.io
docker ps
sudo chown $USER /var/run/docker.sock
```

### Step 2.1: Create the Docker image and run it
- Use the files provided to create your image and test run it
``` shell
docker build -t threetier-backend:latest .
docker run -d -p 8080:8080 threetier-backend:latest
```
### Step 2.2: Push the backend Docker image to the repository of your choice
``` shell

```
### Step 3: Setup EKS Cluster

### Step 4: Run Manifests
``` shell
kubectl create namespace three-tier
kubectl apply -f .
kubectl delete -f .
```



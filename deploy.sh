
# cat deploy.sh

#!/bin/bash

image=$1
name=$2
port=$3

kubectl create deployment $name --image=$image
kubectl expose deployment $name --port=80 --target-port=$port --name $name --type=LoadBalancer
kubectl create ingress $name --rule="$name.kube.reaz.io/*=$name:80"

## Example: sh deploy.sh [image] [name] [port]

# sh deploy.sh linuxserver/nginx nginx 80

# # curl nginx.kube.reaz.io
#     <html>
#         <head>
#             <title>Welcome to our server</title>
#!/bin/bash

root="/Users/gstaffo/Documents/projects/widget-docker-demo"
repos=(
  widget-master
  config-server
  config-server-repo
  consul-docker
  eureka-server
  widget-service
  user-service
)
comment="Fixing filebeat install in Dckerfiles"

for repo in "${repos[@]}"
do
  cd ${root}/${repo} && \
  git add -A && \
  git commit -m "${comment}" && \
  git push && \
  git status
done

cd ../widget-master/

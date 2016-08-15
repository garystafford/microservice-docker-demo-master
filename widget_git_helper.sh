#!/bin/bash

# usage: sh widget_git_helper.sh "Refactoring code"

args=("$@")

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
if [ -n "${args[0]}" ]; then
    comment=${args[0]}
else
    comment="Changes to project..."
fi

echo ${comment}

for repo in "${repos[@]}"
do
  cd ${root}/${repo} && \
  git add -A && \
  git commit -m "${comment}" && \
  git push && \
  git status
done

cd ../widget-master/

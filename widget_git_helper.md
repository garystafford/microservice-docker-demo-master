## Lazy git Add, Commit, Push all Widget Projects

```bash
root="/Users/gstaffo/Documents/projects/widget-docker-demo"
repos=(
  widget-master
  config-server
  config-server-repo
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
```

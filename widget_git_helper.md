Lazy git add, commit, push all widget projects

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
comment="Refactoring configuration, README"

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

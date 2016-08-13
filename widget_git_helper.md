lazy git add, commit, push all widget projects

```bash
root="/Users/gstaffo/Documents/projects/widget-docker-demo"

comment="Refactoring configuration, README"

cd ${root}/widget-master && \
git add -A && \
git commit -m "${comment}" && \
git push && \
git status

cd ${root}/config-server && \
git add -A && \
git commit -m "${comment}" && \
git push && \
git status

cd ${root}/config-server-repo && \
git add -A && \
git commit -m "${comment}" && \
git push && \
git status

cd ${root}/eureka-server && \
git add -A && \
git commit -m "${comment}" && \
git push && \
git status

cd ${root}/widget-service && \
git add -A && \
git commit -m "${comment}" && \
git push && \
git status

cd ${root}/user-service && \
git add -A && \
git commit -m "${comment}" && \
git push && \
git status

cd ../widget-master/
```

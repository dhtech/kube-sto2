# gitlab

## Taking a backup

```shell
POSTGRES_POD=$(kubectl get pod -n gitlab -l k8s-app=postgres -o jsonpath={.items[0].metadata.name})
GITLAB_POD=$(kubectl get pod -n gitlab -l k8s-app=gitlab -o jsonpath={.items[0].metadata.name})
kubectl exec -n gitlab "${POSTGRES_POD}" -- su postgres -c pg_dumpall > backup.sql
kubectl exec -n gitlab "${GITLAB_POD}" -- gitlab-rake gitlab:backup:create SKIP=db
BACKUP=$(kubectl exec -n gitlab "${GITLAB_POD}" -- /bin/bash -c 'ls -tr /var/opt/gitlab/backups/*.tar | tail -n 1')
kubectl exec -n gitlab "${GITLAB_POD}" -- cat "${BACKUP}" > backup.tar
```

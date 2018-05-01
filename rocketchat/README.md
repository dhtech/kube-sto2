## create initial user in mongodb
```shell
$ kubectl exec -it -n rocketchat mongodb-podname mongo admin
> db.createUser({ user: 'rocketchat', pwd: 'insert-password-here', roles: [ { role: 'userAdminAnyDatabase', db: 'admin' } ] });
```

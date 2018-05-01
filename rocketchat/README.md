## create initial user in mongodb
```shell
$ kubectl exec -it -n rocketchat mongodb-podname mongo admin
> db.createUser({ user: 'admin', pwd: 'some_secret_password', roles: [ { role: 'userAdminAnyDatabase', db: 'admin' } ] });
$ kubectl exec -it -n rocketchat mongodb-podname mongo admin -u admin -p some_secret_password
> use rocketchat;
> db.createUser({ user: 'rocketchat', pwd: 'some_other_password', roles: [ { role: 'dbOwner',  db: 'rocketchat' } ] });
```

Make sure to write down the admin password if you need it later.

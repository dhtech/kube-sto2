## create initial user in mongodb
```shell
$ kubectl exec -it -n rocketchat mongodb-podname mongo admin
> rs.initiate( {
    _id : "rs0",
    members: [
       { _id: 0, host: "mongodb.rocketchat:27017" },
    ]
})
> db.createUser({ user: 'admin', pwd: 'some_secret_password', roles: [ 'clusterAdmin', { role: 'userAdminAnyDatabase', db: 'admin' } ] });
$ kubectl exec -it -n rocketchat mongodb-podname mongo admin -u admin -p some_secret_password
> use rocketchat;
> db.createUser({ user: 'rocketchat', pwd: 'some_other_password', roles: [ 'clusterMonitor', { role: 'dbOwner',  db: 'rocketchat' } ] });
```

Make sure to write down the admin password if you need it later.

## LDAP

Host: `ldap.ldap`

Port: 389

Reconnect: True

Base DN: `dc=tech,dc=dreamhack,dc=se`

Internal Log Level: Info

Authentication: False

*Sync / Import*

Username Field: `uid`

Unique Identifier Field: `uidNumber`

Default Domain: `tech.dreamhack.se`

Merge Existing Users: `true`

Sync User Data: `true`

User Data Field Map: `{"#{givenName} #{sn}":"name", "gosaMailForwardingAddress":"email"}`

Sync User Avatar: `true`

Background Sync: `true`

Background Sync Interval: `Every 1 hours`

Background Sync Import New Users: `true`

Background Sync Update Existing Users: `true`

*User search*

Filter: `(objectclass=person)`

Scope: `sub`

Search Field: `uid`

*Group Validation*

Enable LDAP User Group Filter: `True`

Group ObjectClass: `posixGroup`

Group ID Attribute: `cn`

Group Member Attribute: `memberUid`

Group Member Format: `#{username}`

Group name: `repo-rw`

Firewalld Setup
====

```
$ yum install firewalld
$ systemctl start firewalld
$ systemctl enable firewalld
```

setting
----
```$ vim /etc/firewalld.conf```

restart
----
```$ firewall-cmd --reload```

service add
----
```$ firewall-cmd --permanent --zone=dmz --add-service=http```

service remove
----
```$ firewall-cmd --permanent --cone=dmz --remove-service=http```

port add
----
```$ firewall-cmd --permanent --zone=public --add-port=8080/tcp```

port remove
----
```firewall-cmd --permanent --zone=public --remove-port=8080/tcp```
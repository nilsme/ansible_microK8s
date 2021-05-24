# README

## Raspberry PI configuration

Go to `/system-boot`, edit `cmdline.txt` and add
`cgroup_enable=memory cgroup_memory=1` at the end of the line.

To enble ssh execute `touch ssh`in `/system-boot`.

> Optional: Set IP and network configuration in `/system-boot/network-config`.  
> TODO: edit hostname --> `/etc/hostname/`

## ansible-playbook

```Shell script
MY_HOST=<my_pi_ip>
echo  $MY_HOST >> hosts
```

```Shell script
ansible-playbook -i hosts -e 'ansible_user=k8smaster' --ask-become-pass deploy.yml
```

> Change `ansible_user` to a user with sudo rights on the host.

## Join node to cluster

Execute on master

```Shell script
microk8s add-node
```

> TODO: set node role: node-role.kubernetes.io/master: master

## Access Dashboard

```Shell script

microk8s dashboard-proxy
```

## Access Portainer

Portainer service is started by ansible. It can be accessed under
`http://<node_ip>:30777`.

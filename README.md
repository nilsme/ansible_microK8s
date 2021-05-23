# README

```Shell script
MY_HOST=<my_pi_ip>
echo  $MY_HOST > hosts
```

```Shell script
ansible-playbook -i hosts -e 'ansible_user=k8smaster' --ask-become-pass deploy.yml
```

## Join node to cluster

Execute on master

```Shell script
microk8s add-node
```

## Access Dashboard

```Shell script

microk8s dashboard-proxy
```

## Access Portainer

Portainer service is started by ansible. It can be accessed under
`http://<node_ip>:30777`.

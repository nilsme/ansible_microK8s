# README

Deploy and manage **microK8s** on Raspberry PI 4 running on Ubuntu.

## Raspberry PI

### Raspberry PI configuration

Mount the drive with the Ubuntu image do the following steps before
the first boot of the system.

1. Go to `/system-boot`, edit `cmdline.txt` and add
   `cgroup_enable=memory cgroup_memory=1` at the end of the line.
2. To enble ssh execute `touch ssh` in `/system-boot`.
3. Optional: Set IP and network configuration in `/system-boot/network-config`.  
4. Optional: Edit hostname in `/etc/hostname/`.

## Ansible

If Anaconda or Miniconda is used the following script will set up an environment
for ansible.

```Shell script
./setup_ansible.sh
```

### microk8s deployment

Add hosts to file `hosts`.

```Shell script
cat > hosts <<EOF
<node1_ip>
<node2_ip>
<node3_ip>
EOF
```

Run deployment playbook.

```Shell script
ansible-playbook -i hosts -e 'ansible_user=root' --ask-become-pass deploy.yml
```

> Change `ansible_user` to a user with sudo rights on the host.

### Shutdown all nodes

```Shell script
ansible-playbook -i hosts shutdown.yml
```

### Updates

```Shell script
ansible-playbook -i hosts update.yml
```

## Cluster Management

### Check cluster status

```Shell script
microk8s status
```

### Join node to cluster

```Shell script
microk8s add-node
```

### Access Kubernetes Dashboard

```Shell script
microk8s dashboard-proxy
```

### Access Portainer

Portainer service is started by ansible. It can be accessed under
`http://<node_ip>:30777`.

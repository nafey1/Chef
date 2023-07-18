# Chef Installation

## Install Dependency for OEL 8
```bash
sudo yum -y install libnsl
```
> Also, verify the ntp / chrony, FQDN

## Configure FQDN (optional, if not already configured)
```bash
sudo hostnamectl set-hostname chef.nafey.com

# cat /etc/sysconfig/network
NETWORKING=yes
HOSTNAME= chef.nafey.com

# specific to OCI compute
# cat /etc/oci-hostname.conf 
PRESERVE_HOSTINFO=2

# cat /etc/hosts
172.30.0.2 chef.nafey.world chef
172.30.0.2 bastion.public.toronto.oraclevcn.com bastion
```
> Reboot the server for the changes to take effect


## Chef Server Installation
```bash 
sudo yum -y install https://packages.chef.io/files/stable/chef-server/12.19.31/el/7/chef-server-core-12.19.31-1.el7.x86_64.rpm
```


## Configure Chef Server
```bash
sudo chef-server-ctl reconfigure
```

## Check the status of Chef Server
```bash
sudo chef-server-ctl status
```

## Open Firewall Ports (Optional, if Chef Manage is required)
```bash
sudo firewall-cmd --permanent --add-service={http,https}
sudo firewall-cmd --reload
```

## Install Chef Manage (Optional)
Chef Manage is a premium add-on that provides a graphical user interface for managing common Chef server tasks

```bash
sudo chef-server-ctl install chef-manage 
sudo chef-manage-ctl reconfigure
```

## Create a User
```bash
sudo chef-server-ctl user-create admin Farooq Nafey admin@gmail.com oracle123 --filename /etc/chef/admin.pem
```

## Create an Organization
Create an organization and associate the admin user with the Organization
```bash
sudo chef-server-ctl org-create demo "Demo Organization for Learning" --association_user admin --filename /etc/chef/demo-validator.pem
```

## Access the Chef Server using a browser
```
https://<public-ip-address>
```


[Chef Server Download](https://community.chef.io/downloads/tools/infra-server?os=el)

[Installation](https://computingforgeeks.com/how-to-setup-chef-infra-server-on-centos-rhel/?expand_article=1)

[Instructions](https://www.youtube.com/watch?v=wDUOtiJCSMs)
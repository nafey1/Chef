# Define dependencies between Cookbooks

## Define first cookbook
Assume we want to make sure that NTP is configured before Apache installation
```bash
chef generate cookbook ntpserver
```
> Configure the cookbook to enable the ntp service, by defining multiple recipes within the recipes folder and combining them in *default.rb* file

## Modify the Webserver Cookbook
First, define the cookbook that needs to linked to the linked with the second cookbook

```bash
cat metadata.rb
depends 'ntpserver'
```

Lastly, add the default recipe of the ntpserver in you webserver cookbook.

```bash
cat default.rb
include_recipe 'ntpserver::default'
include_recipe 'webserver::apachepkg'
include_recipe 'webserver::apacheindex'
include_recipe 'webserver::apacheservice'
```

## Execute the Webserver cookbook
```bash
chef-client --local-mode --why-run --runlist "recipe[webserver]"
```
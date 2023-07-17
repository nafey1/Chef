# Create Chef Run Lists

## 1. RunList with Default Recipe
```bash
chef-client --local-mode --why-run --runlist "recipe[webserver::default]"
```

## 2. RunList with no Name Specified
```bash
chef-client --local-mode --why-run --runlist "recipe[webserver]"
```
> When no recipe name is provided, Chef will run the one with the default name

## 3. RunList with a non-default name
```bash
chef-client --local-mode --why-run --runlist "recipe[webserver::apache]"
```
> No code is specified in the **default.rb** recipe


## 4. Combine multiple RunLists
Specify multiple runlist in the order of execution
```bash
chef-client --local-mode --why-run --runlist "recipe[webserver::default],recipe[webserver::apache]"
```

## Bundle Recipes together to avoid creating long ones
```bash
cat default.rb
include_recipe 'webserver::apachepkg'
include_recipe 'webserver::apacheindex'
include_recipe 'webserver::apacheservice'
```
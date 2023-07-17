# Create Chef Cook Books

## Create a skeleton Cook Book
```bash
chef generate cookbook webserver
Generating cookbook webserver
Loading Chef InSpec profile files:
Loading Chef InSpec input files:
Loading Chef InSpec waiver files:
- Ensuring correct cookbook content

Your cookbook is ready. Type `cd webserver` to enter it.

There are several commands you can run to get started locally developing and testing your cookbook.
Type `delivery local --help` to see a full list of local testing commands.

Why not start by writing an InSpec test? Tests for the default recipe are stored at:

test/integration/default/default_test.rb

If you'd prefer to dive right in, the default recipe can be found at:

recipes/default.rb
```

## Verify the Cookbook Structure
```bash
pwd
/home/opc/chef-repo/cookbooks
[opc@workstation cookbooks]$ cd webserver/
[opc@workstation webserver]$ tree
.
├── CHANGELOG.md
├── chefignore
├── kitchen.yml
├── LICENSE
├── metadata.rb
├── Policyfile.rb
├── README.md
├── recipes
│   └── default.rb
└── test
    └── integration
        └── default
            └── default_test.rb

4 directories, 9 files
```
> Recipes are defined in **default.rb** file inside the **recipes** folder

## Create a Recipe in default.rb file file
```rb
# Install latest apache package
dnf_package 'httpd' do
  action :install
end

# Create the Apache web file
file '/var/www/html/index.html' do
  content "This web page is created by Chef Cookbook\n"
  action :create
end

# This recipe combines multiple actions on the same resource
systemd_unit 'httpd' do
  verify   true
  action   [:start, :enable]
end
```

## Check a Cookbook for errors
```bash
cookstyle /home/opc/chef-repo/cookbooks/webserver
Inspecting 4 files
....

4 files inspected, no offenses detected
```

## Test the Cookbook
Abridged output
```bash
sudo chef-client --local-mode --why-run /home/opc/chef-repo/cookbooks/webserver/recipes/default.rb
Chef Infra Client, version 17.6.18
Patents: https://www.chef.io/patents
Infra Phase starting
Resolving cookbooks for run list: []
Synchronizing cookbooks:
Installing cookbook gem dependencies:
Compiling cookbooks...
Loading Chef InSpec profile files:
Loading Chef InSpec input files:
Loading Chef InSpec waiver files:
Converging 3 resources
Recipe: @recipe_files::/home/opc/chef-repo/cookbooks/webserver/recipes/default.rb
  * dnf_package[httpd] action install
    - Would install version 0:2.4.37-56.0.1.module+el8.8.0+21057+13668aee.6.x86_64 of package httpd
  * file[/var/www/html/index.html] action create
    - Would create new file /var/www/html/index.html
    - Would restore selinux security context
  * systemd_unit[httpd] action start
    - Would starting unit: httpd
  * systemd_unit[httpd] action enable
    - Would enabling unit: httpd


Running handlers:
Running handlers complete
Infra Phase complete, 4/4 resources would have been updated
```

## Run the Cookbook
```bash
sudo chef-client --local-mode /home/opc/chef-repo/cookbooks/webserver/recipes/default.rb
Chef Infra Client, version 17.6.18
Patents: https://www.chef.io/patents
Infra Phase starting
Resolving cookbooks for run list: []
Synchronizing cookbooks:
Installing cookbook gem dependencies:
Compiling cookbooks...
Loading Chef InSpec profile files:
Loading Chef InSpec input files:
Loading Chef InSpec waiver files:
Converging 3 resources
Recipe: @recipe_files::/home/opc/chef-repo/cookbooks/webserver/recipes/default.rb
  * dnf_package[httpd] action install
    - install version 0:2.4.37-56.0.1.module+el8.8.0+21057+13668aee.6.x86_64 of package httpd
  * file[/var/www/html/index.html] action create
    - create new file /var/www/html/index.html
    - update content in file /var/www/html/index.html from none to 2d77ca
    --- /var/www/html/index.html	2023-07-16 05:06:18.081425978 +0000
    +++ /var/www/html/.chef-index20230716-327706-5hmfi8.html	2023-07-16 05:06:18.080425965 +0000
    @@ -1 +1,2 @@
    +This web page is created by Chef Cookbook
    - restore selinux security context
  * systemd_unit[httpd] action start
    - starting unit: httpd
  * systemd_unit[httpd] action enable
    - enabling unit: httpd

Running handlers:
Running handlers complete
Infra Phase complete, 4/4 resources updated in 21 seconds
```
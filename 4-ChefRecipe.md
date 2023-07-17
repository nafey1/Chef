# Create a Chef Recipe and Test with Chef Zero

## Steps Required to Create a Chef Recipe

1. Create
    - Create a Chef Recipe in Ruby with **rb extension**
2. Check
    - Check the syntax with native utility **cookstyle**
3. Test
    - Test the code with *chef-client* utility with **--why-run** flag
4. Run
    - Once test, deploy the code using **chef-client** utility

> Chef Zero is essentially a workstation used for developing, testing and deploying code locally

## 1. Create a Resource file

```rb
dnf_package 'httpd' do
  action :install
end
```


## 2. Check the Resource file

```bash
cookstyle apache.rb
Inspecting 1 file
.

1 file inspected, no offenses detected
```

## 3. Test the Code
Abridged output

```bash
chef-client --local-mode --why-run apache.rb
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
Converging 1 resources
Recipe: @recipe_files::/home/opc/chef-recipe/apache.rb
  * dnf_package[httpd] action install
    - Would install version 0:2.4.37-56.0.1.module+el8.8.0+21057+13668aee.6.x86_64 of package httpd
[2023-07-14T05:24:35+00:00] WARN: In why-run mode, so NOT performing node save.

Running handlers:
Running handlers complete
Infra Phase complete, 1/1 resources would have been updated
```

## 4. Run the code
Abridged output

```bash
sudo chef-client --local-mode  apache.rb
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
[2023-07-15T03:18:34+00:00] WARN: Node workstation.public.toronto.oraclevcn.com has an empty run list.
Converging 1 resources
Recipe: @recipe_files::/home/opc/chef-recipe/apache.rb
  * dnf_package[httpd] action install
    - install version 0:2.4.37-56.0.1.module+el8.8.0+21057+13668aee.6.x86_64 of package httpd

Running handlers:
Running handlers complete
Infra Phase complete, 1/1 resources updated in 24 seconds
```
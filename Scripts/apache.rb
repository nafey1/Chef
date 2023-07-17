# Install latest apache package
dnf_package 'httpd' do
  action :install
end
# Create the Apache web file
file '/var/www/html/index.html' do
  content "This web page is created by Chef\n"
  action :create
end
# This recipe combines multiple actions on the same resource
systemd_unit 'httpd' do
  verify   true
  action   [:start, :enable]
end
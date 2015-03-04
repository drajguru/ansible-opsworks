require 'json'

extra_vars = {}
extra_vars['opsworks'] = node['opsworks']
extra_vars['ansible']  = node['ansible']

execute "deploy" do
  command "ansible-playbook -i /home/ubuntu/ansible/inv /home/ubuntu/ansible/deploy.yml --extra-vars '#{extra_vars.to_json}'"
  only_if { ::File.exists?("/home/ubuntu/ansible/deploy.yml")}
  action :run
end

if ::File.exists?("/home/ubuntu/ansible/deploy.yml")
  Chef::Log.info("Log into #{node['opsworks']['instance']['private_ip']} and view /var/log/ansible.log to see the output of your ansible run")
else
  Chef::Log.info("No updates: /home/ubuntu/ansible/deploy.yml not found")
end

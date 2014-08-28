#
# Cookbook Name:: boundary
# Recipe:: default
#
# Copyright 2014, Chillibean Ltd
#
#


include_recipe 'nodejs' 

execute "install boundary agent" do
  command "sudo curl -s -d '{\"token\":\"#{ node["boundary"]["agent_token"] }\"}' -H 'Content-Type: application/json' https://premium.boundary.com/agent/install | sh"
  creates "/tmp/something"
  action :run
end

execute "installing graphdat-relay" do
	#not_if "npm ls | grep graphdat-relay"
    command 'sudo npm install graphdat-relay -g'
    action :run
 end  

directory "/etc/graphdat-relay" do
  owner "root"
  group "root"
  mode 00755
  action :create
end

template "/etc/init.d/graphdat-relay" do
  mode "0777"
  source "graphdat-relay.erb"
end

execute "run command to create config.json" do
 # not_if { ::File.exists?("/etc/graphdat-relay/config.json")}
  command "graphdat-relay -e \"#{ node["boundary"]["email"] }\" -t \"#{ node["boundary"]["api_token"] }\""
  cwd "/etc/graphdat-relay"
  action :run
end


execute "add graphdat-relay to boot" do
	command "sudo update-rc.d graphdat-relay defaults"
	action :run
end

execute "start relay service" do
  command "sudo /etc/init.d/graphdat-relay start"
  action :run
end

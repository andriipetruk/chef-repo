#
# Cookbook Name:: jenkins_slave
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#include_recipe 'java'
include_recipe 'windows'
require 'chef/win32/version'

win_version = Chef::ReservedNames::Win32::Version.new


node.run_state[:jenkins_username] = node['jenkins']['username']
node.run_state[:jenkins_password] = node['jenkins']['password']


user node['jenkins']['user'] do
  password node['jenkins']['pass']
end



directory  node['jenkins']['remote_fs']  do
  action :create
  recursive true
  rights :full_control, node['jenkins']['user'], :applies_to_children => true
end

env "JAVA_HOME" do
  value node['openjdk']
end

env "path" do
  delim ";"
  value '%JAVA_HOME%\\bin'
  action :modify
end

#For Command Prompt
execute "setPathCMD" do
  command "set PATH=#{node['openjdk']}\\bin;%PATH%"
end
#For PowerShell
powershell_script "setPathPS" do
  code <<-EOH
  $env:Path="#{node['openjdk']}\\bin;$env:Path"
  EOH
end

ENV['Path'] += "#{node['openjdk']}\\bin"

include_recipe 'runit'
jenkins_windows_slave node['jenkins']['slave_name'] do
      description node['jenkins']['slave_desc']
      remote_fs   node['jenkins']['remote_fs']
      labels      node['jenkins']['labels']
      user	  node['jenkins']['user']
      password    node['jenkins']['pass']
      executors node['jenkins']['executors']
      usage_mode node['jenkins']['usage_mode']
      availability node['jenkins']['availability']
      in_demand_delay node['jenkins']['in_demand_delay']
      idle_delay node['jenkins']['idle_delay']
end


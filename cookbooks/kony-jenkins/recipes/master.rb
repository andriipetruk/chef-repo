#
# Cookbook:: kony-jenkins
# Recipe:: master
#
# Copyright:: 2017, The Authors, All Rights Reserved.

directory '/data/jobs' do
  action :nothing
  owner node['jenkins']['master']['user']
  group node['jenkins']['master']['user']
  mode '0755'
  recursive true
  subscribes :create, "directory[#{node['jenkins']['master']['home']}]", :immediately
  notifies   :create, "link[#{node['jenkins']['master']['home']}/jobs]", :immediately
end

link "#{node['jenkins']['master']['home']}/jobs" do
  action :nothing
  to '/data/jobs'
end

include_recipe 'chef-sugar::default'
include_recipe 'java_se'
include_recipe 'selinux::disabled'
include_recipe 'jenkins::master'


# Install any required plugins and setup auth.
include_recipe 'kony-jenkins::plugins'
include_recipe 'kony-jenkins::auth'

#nginx reverse proxy for  Jenkins 
include_recipe 'kony-jenkins::nginx'

# Setup .gitconfig, needed on first chef
template "#{node['jenkins']['master']['home']}/.gitconfig" do
  source 'gitconfig.erb'
  user node['jenkins']['master']['user']
  group node['jenkins']['master']['group']
end

# Initial jenkinds-dsl-bootstrap job
cookbook_file "#{Chef::Config[:file_cache_path]}/jenkins-job-DSL-bootstrap.xml" do
  source 'jenkins-job-DSL-bootstrap.xml'
end

xml = File.join(Chef::Config[:file_cache_path], 'jenkins-job-DSL-bootstrap.xml')
jenkins_job 'jenkins-job-DSL-bootstrap' do
  config xml
end

template '/etc/sudoers.d/jenkins-sudoers' do
  source 'jenkins-sudoers.erb'
end


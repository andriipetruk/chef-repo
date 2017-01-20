#
# Cookbook:: base
# Recipe:: default
#
# Copyright:: 2017, Andrii Petruk, All Rights Reserved.



# install & update software
include_recipe 'kony-base::_packages'
# access control for ssh and sudo
include_recipe 'kony-base::_users'

# chef-client updates and config
include_recipe 'kony-base::_chef'
# UTC timezone and ntp config
include_recipe 'kony-base::_clock'
include_recipe 'locale::default'
#set local permanently
template "/etc/environment" do
        source "env.erb"
        mode 0644
        owner "root"
        group "root"
end


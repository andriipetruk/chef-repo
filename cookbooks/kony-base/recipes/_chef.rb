# install the chef-client service
include_recipe 'chef-client::config'
include_recipe 'chef-client::init_service'

# set all nodes to use the same version of the chef-client
include_recipe 'omnibus_updater'

# give chef a hint on the virtualization metadata services to use with ohai
directory '/etc/chef/ohai/hints' do
  recursive true
end

file "/etc/chef/ohai/hints/#{node['ohai-platform-hint']}.json"




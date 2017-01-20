include_recipe 'sudo'

# configure administrative access
users_manage 'sysadmin' do
  group_id 2300
  action [:remove, :create]
end



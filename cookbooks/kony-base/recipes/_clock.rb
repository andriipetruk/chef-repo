# set all machines to use the UTC timezone
link '/etc/localtime' do
  to '/usr/share/zoneinfo/UTC'
  not_if "readlink /etc/localtime | grep -q 'UTC$'"
end

file '/etc/sysconfig/clock' do
  only_if { node['platform_family'] == 'rhel' }
  content "ZONE=\"Etc/UTC\"\n"
end

# sync the system clock with an ntp server
include_recipe 'ntp::default'

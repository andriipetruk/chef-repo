include_recipe 'yum'
include_recipe 'yum-epel'
node.set['build-essential']['compile_time'] = true
include_recipe 'build-essential'

  %w{
   bash
   cronie
   lsof
   man
   mc
   mlocate
   nc
   pwgen
   redhat-lsb-core
   screen
   telnet
   tree
   wget
   vim
  }.each do |pkg|
    package pkg do
      action :upgrade
    end
  end

%w{
  autoconf
  bison
  flex
  gcc
  gcc-c++
  kernel-devel
  make
  m4
  patch
  libxslt-devel
  libxml2-devel
}.each do |build_tool|
  yum_package(build_tool) do
    action :nothing
  end.run_action(:install)
end

chef_gem 'nokogiri' do
  options '-- --use-system-libraries'
  retries 2
end

yum_package 'yum-cron' do
  action :remove
end

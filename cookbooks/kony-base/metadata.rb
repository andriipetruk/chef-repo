name 'kony-base'
maintainer 'Andrii Petruk'
maintainer_email 'andrey.petruk@gmail.com'
license 'all_rights'
description      'Baseline cookbook that configures a common set of user access, monitoring, and chef-client monitoring across all nodes",'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.2'

# issues_url 'https://github.com/<insert_org_here>/base/issues' if respond_to?(:issues_url)
# source_url 'https://github.com/<insert_org_here>/base' if respond_to?(:source_url)


depends 'chef-client'
depends 'users'
depends 'sudo'
depends 'yum'
depends 'yum-epel'
depends 'omnibus_updater'
depends 'hostsfile'
depends 'gelf_handler'
depends 'chef_handler'
depends 'ntp'
depends 'build-essential'
depends 'locale'

recipe 'default', 'configures baseline access, monitoring, utilities, and system config'


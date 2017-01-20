name             'kony-jenkins'
maintainer       'Andrii Petruk'
maintainer_email 'andrey.petruk@gmail.com'
license          'All rights reserved'
description      'Installs/Configures jenkins'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.2'


depends 'chef-sugar', '~> 1.2'
depends 'jenkins', '~> 2.0'
depends 'nginx'
depends 'java_se', '~> 8.0'
depends 'git'
depends 'selinux'
depends 'ruby_build'
depends 'partial_search'
depends 'apt'


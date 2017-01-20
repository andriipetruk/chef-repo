default['authorization']['sudo']['groups']            = [ 'admin', 'wheel', 'sysadmin' ]
default['authorization']['sudo']['include_sudoers_d'] = true
default['authorization']['sudo']['passwordless']      = true


default['ntp']['servers'] = [ '0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org', '3.pool.ntp.org' ]

#set locale
default['locale']['lang'] = 'en_US.UTF-8'
default['locale']['lc_all'] = 'en_US.UTF-8'


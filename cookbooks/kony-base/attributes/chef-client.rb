#override['omnibus_updater']['version'] = ''
override['omnibus_updater']['restart_chef_service'] = true

override['chef_client']['config']['ssl_verify_mode'] = ':verify_peer'
override['chef_client']['config']['client_fork']     = true

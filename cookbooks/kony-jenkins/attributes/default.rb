# Jenkins service uid and home
default['jenkins']['master']['user'] = 'jenkins'
default['jenkins']['master']['home'] = '/srv/jenkins'
default['jenkins']['slave']['user'] = 'jenkins'
default['jenkins']['slave']['home'] = '/home/jenkins'

# java memory settings for the JVMArgs gem
default['jenkins']['master']['jvm_heap_size'] = '60%'
default['jenkins']['master']['jvm_permgen']   = '256m'
default['jenkins']['slave']['jvm_heap_size']  = '256m'
default['jenkins']['slave']['jvm_permgen']    = '128m'

default['jenkins']['master']['install_method'] = 'war'

default['kony-jenkins']['auth']                  = 'github' 
default['kony-jenkins']['AuthorizationStrategy'] = 'FullControlOnceLoggedInAuthorizationStrategy' 

default['kony-jenkins']['github']['site']         = 'https://github.com'
default['kony-jenkins']['github']['api_endpoint'] = 'https://api.github.com'
default['kony-jenkins']['github']['API_KEY']      = '0ff1851d1bd72ed3a6eb'
default['kony-jenkins']['github']['API_SECRET']   = '2be838e901b48d41e07aa389e45eeabd2af3052b'

default['jenkins']['port'] = 8080
override['jenkins']['master']['version'] = '1.658-1.1'

default['kony-jenkins']['git']['name']  = 'jenkins'
default['kony-jenkins']['git']['email'] = 'jenkins@example.com'



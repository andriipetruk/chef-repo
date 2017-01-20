
#  These keys are for the 'chef' Jenkins user to interact with the Jenkins API.
#  Create a public/private key pair.
unless node['jenkins']['executor']['private_key']
  require 'net/ssh'
  key = OpenSSL::PKey::RSA.new(4096)
  # Set them in our cookbook scope till Jenkins is ready to use them.
  node.set['kony-jenkins']['user']['private_key'] = key.to_pem
  node.set['kony-jenkins']['user']['public_key'] =
    "#{key.ssh_type} #{[key.to_blob].pack('m0')}"
end

# Creates the 'chef' Jenkins user and assciates the public key
jenkins_user 'chef' do
  full_name   'Chef Client'
  public_keys [ node['kony-jenkins']['user']['public_key'] ]
end

# Set the private key on the Jenkins executor, must be done only after the user
#  has been created, otherwise API will require authentication and not be able
#  to create the user.
ruby_block 'set private key' do
  block do
    node.set['jenkins']['executor']['private_key'] =
    node['kony-jenkins']['user']['private_key']
  end
end

# If auth scheme is set, include recipe with that implementation.
if node['kony-jenkins']['auth']
  include_recipe "kony-jenkins::_auth-#{node['kony-jenkins']['auth']}"
end

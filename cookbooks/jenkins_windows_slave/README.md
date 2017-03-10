# jenkins_jnlp_slave

This cookbook installs the jenkins JNLP slave through Chef. 

This cookbook uses the jenkins cookbook to provide the option of setting up jenkins slaves on a newly provisioned box and connect it to a jenkins master server. You can use attributes such as jenkins master host, port, jenkins admin username, password to create a jenkins slave through JNLP. 

## Recipe

Add ```include_recipe jenkins_jnlp_slave::default``` to your recipe.

## Attributes

Please see ```attributes/defaults.rb``` for more information to customize the cookbook. 

## Contribute

Please contact me if you want to contribute to this cookbook.


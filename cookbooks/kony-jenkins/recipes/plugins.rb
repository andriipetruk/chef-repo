restart_required = false


# git-essentails, add other scm's here
package 'git'
%w(git credentials ssh-credentials git-client scm-api github github-api github-oauth mailer).each do |plugin|
  plugin, version = plugin.split('=')
  jenkins_plugin plugin do
    version version if version
    notifies :create, "ruby_block[jenkins_restart_flag]", :immediately
  end
end

# build-pipeline-plugin
%w(javadoc maven-plugin jquery dashboard-view parameterized-trigger token-macro run-condition conditional-buildstep build-pipeline-plugin).each do |plugin|
  plugin, version = plugin.split('=')
  jenkins_plugin plugin do
    version version if version
    notifies :create, "ruby_block[jenkins_restart_flag]", :immediately
  end
end

# Folders
%w(matrix-auth credentials cloudbees-folder nested-view).each do |plugin|
  plugin, version = plugin.split('=')
  jenkins_plugin plugin do
    version version if version
    notifies :create, "ruby_block[jenkins_restart_flag]", :immediately
  end
end

# others
%w(job-dsl promoted-builds greenballs pegdown-formatter port-allocator).each do |plugin|
  plugin, version = plugin.split('=')
  jenkins_plugin plugin do
    version version if version
    notifies :create, "ruby_block[jenkins_restart_flag]", :immediately
  end
end

# More others
%w(copyartifact checkstyle ansicolor build-blocker-plugin build-user-vars-plugin envinject gradle grails groovy groovy-postbuild violations).each do |plugin|
  plugin, version = plugin.split('=')
  jenkins_plugin plugin do
    version version if version
    notifies :create, "ruby_block[jenkins_restart_flag]", :immediately
  end
end
### Plugins End ###


# Is notified only when a 'jenkins_plugin' is installed or updated.
ruby_block "jenkins_restart_flag" do
  block do
    restart_required = true
  end
  action :nothing
end

jenkins_command 'restart' do
  only_if { restart_required }
end

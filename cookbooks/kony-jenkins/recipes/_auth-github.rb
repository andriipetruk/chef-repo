jenkins_script 'add_gh_authentication' do
  command <<-EOH.gsub(/^ {4}/, '')
    import jenkins.model.*
    import hudson.security.*
    import org.jenkinsci.plugins.*

    def instance = Jenkins.getInstance()

    def githubRealm = new GithubSecurityRealm(
      '#{node['kony-jenkins']['github']['site']}',
      '#{node['kony-jenkins']['github']['api_endpoint']}',
      '#{node['kony-jenkins']['github']['API_KEY']}',
      '#{node['kony-jenkins']['github']['API_SECRET']}'
    )
    instance.setSecurityRealm(githubRealm)

    def strategy = new #{node['kony-jenkins']['AuthorizationStrategy']}()
    instance.setAuthorizationStrategy(strategy)

    instance.save()
  EOH
end

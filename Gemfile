source 'https://rubygems.org'

gemspec

if ENV['VCLOUD_TOOLS_DEV_FOG_MASTER']
  gem 'fog', :git => 'git@github.com:fog/fog.git', :branch => 'master'
elsif ENV['VCLOUD_TOOLS_DEV_FOG_LOCAL']
  gem 'fog', :path => '../fog'
end

gem 'vcloud-tools-tester', :path => '../vcloud-tools-tester'

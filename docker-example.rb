#
# Cookbook Name:: adaptivehosting
# Recipe:: setup
#
# Copyright 2014, Hello Future Ltd
#
# All rights reserved - Do Not Redistribute
#

node.default['build-essential']['compile_time'] = true

include_recipe 'build-essential'

include_recipe 'aufs'

node.set['docker']['package']['repo_url'] = 'https://get.docker.io/ubuntu'
node.set['docker']['storage_driver'] = 'aufs'

include_recipe 'docker'

chef_gem 'chef-metal' do
  action :install
end

package 'lxc-dev' do
  action :install
  notifies :install, 'chef_gem[chef-metal-docker]', :immediately
end

chef_gem 'chef-metal-docker' do
  action :nothing
end
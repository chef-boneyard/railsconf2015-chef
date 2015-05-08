#
# Cookbook Name:: .
# Recipe:: deploy_user
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

user 'deploy' do
  uid 500
  manage_home true
  shell '/bin/bash'
end

group 'deploy' do
  gid 500
end

template '/etc/sudoers.d/deploy' do
  source 'deploy.erb'
  mode '0440'
  owner 'root'
  group 'root'
end
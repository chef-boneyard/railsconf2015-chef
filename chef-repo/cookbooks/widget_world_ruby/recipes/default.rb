#
# Cookbook Name:: widget_world_ruby
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package 'libgdbm3'

remote_file '/var/tmp/ruby-2.2.2_amd64.deb' do
  source 'https://s3.amazonaws.com/chef-railsconf-2015/ruby-2.2.2_amd64.deb'
  checksum '6ea925b1b610a722375971100951866ce0c182b5d47bf714debd0d0b95d9f6d9'
end

dpkg_package 'ruby-2.2.2' do
  source '/var/tmp/ruby-2.2.2_amd64.deb'
end

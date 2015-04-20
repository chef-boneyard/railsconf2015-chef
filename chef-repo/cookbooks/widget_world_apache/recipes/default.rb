#
# Cookbook Name:: widget_world_apache
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package 'apache2'

service 'apache2' do
  action :start
end
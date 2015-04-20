#
# Cookbook Name:: widget_world_application
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

directory '/var/www/railsapps/widgetworld/releases' do
  owner 'deploy'
  group 'deploy'
end
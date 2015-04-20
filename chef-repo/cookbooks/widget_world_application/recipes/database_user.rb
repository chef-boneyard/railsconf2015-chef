#
# Cookbook Name:: widget_world_application
# Recipe:: database_user
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

database_username = node['widget_world_application']['database']['username']
database_password = node['widget_world_application']['database']['password']

execute "create new postgres user" do
  user "postgres"
  command "psql -c \"create user #{database_username} with password '#{database_password}';\"; psql -c \"alter user #{database_username} CREATEDB;\""
  not_if { `sudo -u postgres psql -tAc \"SELECT 1 FROM pg_roles WHERE rolname=\'#{database_username}\'\" | wc -l`.chomp == "1" }
  sensitive true
end
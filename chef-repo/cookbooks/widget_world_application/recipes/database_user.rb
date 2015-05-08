#
# Cookbook Name:: widget_world_application
# Recipe:: database_user
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe "widget_world_postgres::default"

database_username = node['widget_world_application']['database']['username']
database_password = node['widget_world_application']['database']['password']

execute "create new postgres user" do # ~FC009
  user "postgres"
  command "psql -c \"create user #{database_username} with password '#{database_password}';\"; psql -c \"alter user #{database_username} CREATEDB;\""
  not_if "psql -tAc \"SELECT 1 FROM pg_roles WHERE rolname = 'widgetworld'\" | grep 1", :user => 'postgres'
  sensitive true 
end

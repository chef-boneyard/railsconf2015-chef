#
# Cookbook Name:: widget_world_application
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'widget_world_ruby::default'
include_recipe 'widget_world_postgres::default'
include_recipe 'widget_world_apache::default'
include_recipe 'widget_world_passenger::default'
include_recipe 'widget_world_application::database_user'
include_recipe 'widget_world_application::deploy_user'

package 'nodejs'
gem_package 'bundler'

directory '/var/www/railsapps/widgetworld/releases' do
  owner 'deploy'
  group 'deploy'
  recursive true
end

remote_file "/var/www/railsapps/widgetworld/releases/#{node['widget_world_application']['version']}.tar.gz" do
  source "https://github.com/nellshamrell/widgetworld/archive/#{node['widget_world_application']['version']}.tar.gz"
  owner 'deploy'
  group 'deploy'
  checksum node['widget_world_application']['sha256sum']
  notifies :run, 'execute[untar release]', :immediately
end

execute 'untar release' do
  user 'deploy'
  command "tar xzvf /var/www/railsapps/widgetworld/releases/#{node['widget_world_application']['version']}.tar.gz -C /var/www/railsapps/widgetworld/releases"
  action :nothing
  notifies :run, 'execute[bundle install]', :immediately
end

execute 'bundle install' do
  cwd "/var/www/railsapps/widgetworld/releases/widgetworld-#{node['widget_world_application']['version']}"
  command '/usr/bin/bundle' # make sure we're using the system ruby, not the omnibus ruby
  action :nothing
  user 'deploy'
  notifies :run, 'execute[Gem.clear_paths]', :immediately
  notifies :create, 'template[database.yml]', :immediately
  notifies :run, 'execute[db migrate]', :immediately
end

execute 'Gem.clear_paths' do
  command '/usr/bin/ruby -e Gem.clear_paths' # make sure we're using the system ruby, not the omnibus ruby
  action :nothing
end

template 'database.yml' do 
  path "/var/www/railsapps/widgetworld/releases/widgetworld-#{node['widget_world_application']['version']}/config/database.yml"
  owner 'deploy'
  group 'deploy'
  mode '0644'
  source 'database.yml.erb'
  sensitive true
end

template "/var/www/railsapps/widgetworld/releases/widgetworld-#{node['widget_world_application']['version']}/config/secrets.yml" do
  owner 'deploy'
  group 'deploy'
  mode '0644'
  source 'secrets.yml.erb'
  notifies :restart, 'service[apache2]'
  sensitive true
end

execute 'db migrate' do
  user 'deploy'
  command 'RAILS_ENV=production rake db:create db:migrate'
  cwd "/var/www/railsapps/widgetworld/releases/widgetworld-#{node['widget_world_application']['version']}"
  action :nothing
end

link 'current' do
  target_file '/var/www/railsapps/widgetworld/current'
  to "/var/www/railsapps/widgetworld/releases/widgetworld-#{node['widget_world_application']['version']}"
end

template '/etc/apache2/sites-available/widgetworld' do
  notifies :restart, 'service[apache2]'
end

link '/etc/apache2/sites-enabled/widgetworld' do
  to '/etc/apache2/sites-available/widgetworld'
  notifies :restart, 'service[apache2]'
end

link '/etc/apache2/sites-enabled/000-default' do
  to '/etc/apache2/sites-available/default'
  action :delete
  notifies :restart, 'service[apache2]'
end


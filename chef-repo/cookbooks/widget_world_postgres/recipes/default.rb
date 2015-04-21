#
# Cookbook Name:: widget_world_postgres
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt::default'

package 'postgresql'
package 'postgresql-contrib'
package 'libpq-dev'
package 'build-essential' # required when installing the pg gem

service 'postgresql' do
  action :nothing
end

template '/etc/postgresql/9.1/main/pg_hba.conf' do
  source 'pg_hba.conf.erb'
  owner 'postgres'
  group 'postgres'
  mode '0640'
  notifies :restart, 'service[postgresql]', :immediately
end
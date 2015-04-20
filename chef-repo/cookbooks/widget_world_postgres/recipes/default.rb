#
# Cookbook Name:: widget_world_postgres
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt::default'

package 'postgresql'
package 'postgresql-contrib'
package 'libpq-dev'

execute 'reload postges' do
  command 'pg_ctl reload'
  action :nothing
end

template '/etc/postgresql/9.1/main/pg_hba.conf' do
  source 'pg_hba.conf.erb'
  owner 'postgres'
  group 'postgres'
  mode '0640'
  notifies :run, 'execute[reload postges]', :immediately
end
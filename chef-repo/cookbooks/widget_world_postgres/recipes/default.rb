#
# Cookbook Name:: widget_world_postgres
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt::default'

package 'postgresql'
package 'postgresql-contrib'
package 'libpq-dev'
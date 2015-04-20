#
# Cookbook Name:: widget_world_passenger
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
apt_repository 'passenger' do
  uri 'https://oss-binaries.phusionpassenger.com/apt/passenger'
  components ['precise', 'main']
  keyserver 'keyserver.ubuntu.com'
  key '561F9B9CAC40B2F7'
end

package 'libapache2-mod-passenger'
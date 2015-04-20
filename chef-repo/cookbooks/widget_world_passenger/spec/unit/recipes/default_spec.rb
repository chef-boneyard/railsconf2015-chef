#
# Cookbook Name:: widget_world_passenger
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'widget_world_passenger::default' do

  context 'When all attributes are default, on an unspecified platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end
    
    it 'sets-up the passenger apt repository' do
      expect(chef_run).to add_apt_repository('passenger')
    end
    
    it 'installs the passenger package for apache' do
      expect(chef_run).to install_package('libapache2-mod-passenger')
    end

  end
end

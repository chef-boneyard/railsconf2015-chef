#
# Cookbook Name:: widget_world_apache
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'widget_world_apache::default' do

  context 'When all attributes are default, on an unspecified platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end
    
    it 'installs the apache package' do
      expect(chef_run).to install_package('apache2')
    end
    
    it 'starts the apache service' do
      expect(chef_run).to start_service('apache2')
    end

  end
end

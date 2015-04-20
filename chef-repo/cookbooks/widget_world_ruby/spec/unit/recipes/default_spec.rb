#
# Cookbook Name:: widget_world_ruby
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'widget_world_ruby::default' do

  context 'When all attributes are default, on an unspecified platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end
    
    it 'downloads the debian package' do
      expect(chef_run).to create_remote_file('/var/tmp/ruby-2.2.2_amd64.deb')
    end
    
    it 'installs the debian package' do
      expect(chef_run).to install_dpkg_package('ruby-2.2.2')
    end
    
    it 'installs dependencies' do
      expect(chef_run).to install_package('libgdbm3')
    end

  end
end

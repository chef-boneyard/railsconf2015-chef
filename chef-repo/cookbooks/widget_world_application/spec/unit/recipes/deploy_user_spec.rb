#
# Cookbook Name:: .
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'widget_world_application::deploy_user' do

  context 'When all attributes are default, on an unspecified platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end
    
    it 'creates the deploy user' do
      expect(chef_run).to create_user('deploy')
    end

    it 'creates the deploy user with a uid of 500' do
      expect(chef_run).to create_user('deploy').with_uid(500)
    end
    
    it 'creates the deploy group' do
      expect(chef_run).to create_group('deploy')
    end
    
    it 'creates the deploy group with a gid of 500' do
      expect(chef_run).to create_group('deploy').with_gid(500)
    end
    
    it 'generates a sudoers rule for the deploy user' do
      expect(chef_run).to render_file('/etc/sudoers.d/deploy')
    end

    it 'generates a sudoers rule for the deploy user with valid permissions' do
      expect(chef_run).to create_template('/etc/sudoers.d/deploy').with(
        mode: '0440'
      )
    end
    it 'generates a sudoers rule for the deploy user with valid ownership' do
      expect(chef_run).to create_template('/etc/sudoers.d/deploy').with(
        owner: 'root',
        group: 'root'
      )
    end
  end
end

#
# Cookbook Name:: widget_world_application
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'widget_world_application::database_user' do

  context 'When all attributes are default, on an unspecified platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end
    
    it 'creates the database user' do
      expect(chef_run).to run_execute('create new postgres user')
    end

  end
end

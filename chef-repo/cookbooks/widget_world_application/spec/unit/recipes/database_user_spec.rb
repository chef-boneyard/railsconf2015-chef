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
    
    before do
      stub_command("psql -tAc \"SELECT 1 FROM pg_roles WHERE rolname = 'widgetworld'\" | grep 1").and_return(1)
      stub_command("psql -c \"create user widgetworld with password 'super_secret';\"; psql -c \"alter user widgetworld CREATEDB;\"").and_return(0)
    end
  
    it 'converges successfully' do
      chef_run # This should not raise an error
    end
    
  end
end

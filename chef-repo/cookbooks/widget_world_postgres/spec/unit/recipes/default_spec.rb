#
# Cookbook Name:: widget_world_postgres
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'widget_world_postgres::default' do

  context 'When all attributes are default, on an unspecified platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'includes the default apt recipe which refreshes the apt cache' do
      expect(chef_run).to include_recipe 'apt::default'
    end

    it 'installs postgresql package' do
      expect(chef_run).to install_package 'postgresql'
    end

    it 'installs postgresql-contrib package' do
      expect(chef_run).to install_package 'postgresql-contrib'
    end

    it 'installs libpq-dev package' do
      expect(chef_run).to install_package 'libpq-dev'
    end

  end
end

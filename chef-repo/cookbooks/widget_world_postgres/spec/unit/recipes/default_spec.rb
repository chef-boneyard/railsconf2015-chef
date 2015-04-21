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

    it 'installs libpq-dev package which is required for the pg gem' do
      expect(chef_run).to install_package 'libpq-dev'
    end

    it 'renders pg_hba.conf file' do
      expect(chef_run).to render_file '/etc/postgresql/9.1/main/pg_hba.conf'
    end

    it 'reloads the postgres config when pg_hba.conf is updated' do
      template = chef_run.template('/etc/postgresql/9.1/main/pg_hba.conf')
      expect(template).to notify('service[postgresql]').to(:restart).immediately
    end

    it 'installs the build-essential package which is required for the pg gem' do
      expect(chef_run).to install_package 'build-essential'
    end

  end
end

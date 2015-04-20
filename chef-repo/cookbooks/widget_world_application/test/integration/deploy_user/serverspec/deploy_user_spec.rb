require 'spec_helper'

describe 'widget_world_application::deploy_user' do

  it 'creates the deploy user' do
    expect(user('deploy')).to exist
  end

  it 'adds the deploy user to the deploy group' do
    expect(user('deploy')).to belong_to_group('deploy')
  end

  it 'gives the deploy user a uid of 500' do
    expect(user('deploy')).to have_uid(500)
  end

  it 'creates a home directory for the deploy user' do
    expect(user('deploy')).to have_home_directory('/home/deploy')
  end

  it 'provides a login shell for the deploy user' do
    expect(user('deploy')).to have_login_shell('/bin/bash')
  end
  
  it 'creates the deploy group' do
    expect(group('deploy')).to exist
  end

  it 'gives the deploy group a gid of 500' do
    expect(group('deploy')).to have_gid(500)
  end
  
  it 'creates a rule for sudoers' do
    expect(file('/etc/sudoers.d/deploy')).to be_file
  end
end
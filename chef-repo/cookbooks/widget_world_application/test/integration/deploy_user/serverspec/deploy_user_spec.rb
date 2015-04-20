require 'spec_helper'

describe 'widget_world_application::deploy_user' do

  it 'creates the deploy user' do
    expect('deploy').to exist
  end

  it 'gives the deploy user a uid of 500' do
    expect('deploy').to have_uid(500)
  end

end
require 'spec_helper'

describe 'widget_world_application::deploy_user' do

  it 'creates the deploy user' do
    expect('deploy').to exist
  end

end
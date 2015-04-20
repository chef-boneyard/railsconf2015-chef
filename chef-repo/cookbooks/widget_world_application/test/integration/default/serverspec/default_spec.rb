require 'spec_helper'

describe 'widget_world_application::default' do
  
  it 'displays the application' do
    expect(command('curl http://localhost').stdout).to match /widgets/i
  end

end
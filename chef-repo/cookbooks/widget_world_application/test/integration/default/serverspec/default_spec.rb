require 'spec_helper'

describe 'widget_world_application::default' do
  
  it 'displays the application' do
    expect(command('wget -qO- http://localhost').stdout).to match /widgets/i
  end

  it 'creates the release directory' do
    expect(file('/var/www/railsapps/widgetworld/releases')).to be_directory
  end

end

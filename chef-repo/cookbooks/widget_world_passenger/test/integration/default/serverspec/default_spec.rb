require 'spec_helper'

describe 'widget_world_passenger::default' do

  it 'installs passenger version 5.0.6' do
    expect(command('passenger -v').stdout).to match(/5\.0\.6)
  end

end
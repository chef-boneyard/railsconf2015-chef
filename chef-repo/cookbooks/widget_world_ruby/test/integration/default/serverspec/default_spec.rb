require 'spec_helper'

describe 'widget_world_ruby::default' do

  # Serverspec examples can be found at
  # http://burtlo.github.io/serverspec.github.io/
  
  it 'installs ruby 2.2.2' do
    expect(command("ruby -v").stdout).to match /^ruby 2.2.2/
  end

end

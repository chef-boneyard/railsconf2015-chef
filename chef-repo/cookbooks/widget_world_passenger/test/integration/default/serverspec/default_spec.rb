require 'spec_helper'

describe 'widget_world_passenger::default' do

  it 'installs passenger apache module' do
    expect(package('libapache2-mod-passenger')).to be_installed
  end

end
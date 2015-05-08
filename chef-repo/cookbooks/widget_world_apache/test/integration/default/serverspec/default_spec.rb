require 'spec_helper'

describe 'widget_world_apache::default' do
  
  it 'responds to http requests' do
    expect(command('curl http://localhost').exit_status).to eq 0
  end

end
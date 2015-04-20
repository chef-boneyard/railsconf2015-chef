require 'spec_helper'

describe 'widget_world_application::database_user' do

  it 'creates the database user' do
    expect(command('sudo -u postgres psql -tAc \"SELECT 1 FROM pg_roles WHERE rolname=\'widgetworld\'\" | wc -l`.chomp == "1"').stdout).to match \1\
  end

end
require 'spec_helper'

describe 'widget_world_application::database_user' do

  it 'creates the database user' do
    expect(command('su  - postgres  -c "psql -tAc \"SELECT 1 FROM pg_roles WHERE rolname=\'widgetworld\'\""').stdout.chomp!).to eq "1"
  end

end
require 'spec_helper'

describe 'widget_world_postgres::default' do

  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  
  it 'installs postgres' do
    expect(package('postgresql')).to be_installed
  end

  it 'installs postgres-contrib' do
    expect(package('postgresql-contrib')).to be_installed
  end

  it 'installs libpq-dev' do
    expect(package('libpq-dev')).to be_installed
  end

end
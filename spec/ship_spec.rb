require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  it 'ship exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_instance_of(Ship)
  end
end

require 'rspec'
require './lib/ship'

RSpec.describe Ship do
  #added in before each method. Use @cruiser when calling cruiser instance variable in test file.
  before :each do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'ship exists' do
    expect(@cruiser).to be_instance_of(Ship)
  end

  it 'has a name' do
    expect(@cruiser.name).to eq("Cruiser")
  end

  it 'has a length' do
    expect(@cruiser.length).to eq(3)
  end

  it 'has a health value' do
    expect(@cruiser.health).to eq(3)
  end

  it 'has been sunk?' do
    expect(@cruiser.sunk?).to be(false)
  end

  it 'can hit the ship & until it is sunk?' do
    @cruiser.hit

    expect(@cruiser.health).to eq(2)

    @cruiser.hit

    expect(@cruiser.health).to eq(1)

    expect(@cruiser.sunk?).to be(false)

    @cruiser.hit

    expect(@cruiser.health).to eq(0)

    expect(@cruiser.sunk?).to be(true)

  end

end

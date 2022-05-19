require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  describe 'Iteration 1' do
    before :each do
      @cell = Cell.new("B4")
    end

    it 'exists' do
      expect(@cell).to be_a(Cell)
    end

    it 'has attributes' do
      expect(@cell.coordinate).to eq("B4")
    end

    it 'has no ship in cell' do
      expect(@cell.ship).to eq(nil)
    end

    it 'can tell if cell is empty' do
      expect(@cell.empty?).to eq(true)
    end

    it 'can place a ship' do
      cruiser = Ship.new("Cruiser", 3)
      @cell.place_ship(cruiser)

      expect(@cell.ship).to eq(cruiser)
      expect(@cell.empty?).to eq(false)
    end

  end

end

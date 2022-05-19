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

  end

end

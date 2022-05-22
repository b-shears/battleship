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

    describe 'robust tests' do

      before :each do
        @cruiser = Ship.new("Cruiser", 3)
      end

      it 'can place a ship' do
        @cell.place_ship(@cruiser)

        expect(@cell.ship).to eq(@cruiser)
        expect(@cell.empty?).to eq(false)
      end

      it 'can tell if a ship has been fired upon' do
        @cell.place_ship(@cruiser)

        expect(@cell.fired_upon).to eq(false)
      end

      it 'can fire upon a ship' do
        @cell.place_ship(@cruiser)
        @cell.fire_upon

        expect(@cell.ship.health).to eq(2)
        expect(@cell.fired_upon).to eq(true)
      end

      describe 'render' do

        before :each do
          @cell_1 = Cell.new("B4")
          @cell_2 = Cell.new("C3")
        end

        it 'renders' do
          expect(@cell_1.render).to eq(".")
        end

        it 'can fire upon a cell' do
          @cell_1.fire_upon

          expect(@cell_1.render).to eq("M")
        end

        it 'can place a ship in another cell' do
          @cell_2.place_ship(@cruiser)

          expect(@cell_2.render).to eq(".")
        end

        it 'displays a ship' do
          @cell_2.place_ship(@cruiser)

          expect(@cell_2.render(true)).to eq("S")
        end

        it 'shows when the ship is hit' do
          @cell_2.place_ship(@cruiser)
          @cell_2.fire_upon

          expect(@cell_2.render).to eq("H")
        end

        it 'shows when the ship is sunk' do
          @cell_2.place_ship(@cruiser)
          @cell_2.fire_upon

          expect(@cruiser.sunk?).to eq(false)

          @cruiser.hit
          @cruiser.hit

          expect(@cruiser.sunk?).to eq(true)
          expect(@cell_2.render).to eq("X")
        end

      end

    end

  end

end

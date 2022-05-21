require './lib/ship'
require './lib/cell'
require './lib/board'
require 'rspec'

RSpec.describe Board do
  describe 'Iteration 2' do
    before :each do
      @board = Board.new
      @cruiser = Ship.new("Cruiser", 3)
      @submarine = Ship.new("Submarine", 2)
    end
    
    it 'exists' do
      expect(@board).to be_a(Board)
    end

    it 'has cells' do
      expect(@board.cells).to be_a(Hash)
      expect(@board.cells.count).to eq(16)
    end

    it 'has valid coordinates' do
      expect(@board.valid_coordinate?("A1")).to eq(true)
      expect(@board.valid_coordinate?("D4")).to eq(true)
      expect(@board.valid_coordinate?("A5")).to eq(false)
      expect(@board.valid_coordinate?("E1")).to eq(false)
      expect(@board.valid_coordinate?("A22")).to eq(false)
    end

    it 'ship length equals coordinate length' do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it 'number coordinates are consecutive' do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
    end

    it 'cant be diagnol' do
      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
    end

    it 'letter coordinates are consecutive' do
      expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
      expect(@board.valid_placement?(@cruiser, ["A1", "D1", "C1"])).to eq(false)
    end
  end
end

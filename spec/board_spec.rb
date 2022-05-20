require './lib/ship'
require './lib/cell'
require './lib/board'
require 'rspec'

RSpec.describe Board do
  describe 'Iteration 2' do
    before :each do
      @board = Board.new

    end
    it 'exists' do
      expect(@board).to be_a(Board)

    end
    it 'has cells' do
      expect(@board.cells).to be_a(Hash)

    end
  end
end

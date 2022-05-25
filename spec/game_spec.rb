require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  describe 'Iteration 3' do
    before :each do
      @game = Game.new
    end

    it 'exists' do
      expect(@game).to be_a(Game)
    end

    it 'has two game boards' do
      expect(@game.player_board).to be_a(Board)
      expect(@game.computer_board).to be_a(Board)
    end

    it 'can set the computer ship on 2 random cells' do
      expect(@game.computer_ship_placement.count).to eq(2)
    end
  end
end

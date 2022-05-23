require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  describe 'Iteration 1' do
    before :each do
      @game = Game.new
      
    end

    it 'exists' do
      expect(@game).to be_a(Game)
    end

    xit 'has two game boards' do
      expect(@game.player_board).to be_a(Board)
      expect(@game.computer_board).to be_a(Board)
    end

  end
end

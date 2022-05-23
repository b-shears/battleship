class Game

  attr_reader :player_board, :computer_board

  def initialize
    @player_board = Board.new
    @computer_board = Board.new

  end

  def start
    puts " Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    input = gets.chomp.downcase
      if input != "p"
        puts "You selected #{input}. Later Loser!"
      elseif input == "p"
        puts "Game On!"
        puts "I have laid out my ships on the grid."
        puts "You now need to lay out your two ships."
        puts "The Cruiser is three units long and the Submarine is two units long."

      else
        puts "You selected #{input}. Invalid Input."

      end

  end
end

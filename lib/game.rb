class Game

  attr_reader :player_board, :computer_board

  def initialize
    @player_board = Board.new
    @computer_board = Board.new

  end

  def start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    input = gets.chomp.downcase
      if input == "q"
        puts "You selected #{input}. Later Loser!"
      elsif input == "p"
        puts "Game On!"
        puts "I have laid out my ships on the grid."
        puts "You now need to lay out your two ships."
        puts "The Cruiser is three units long and the Submarine is two units long."
        puts @player_board.render
        puts "Enter the squares for the Cruiser (3 spaces):"
        puts ">"
        coordinate_1 = gets.chomp.upcase
        if @player_board.valid_coordinate?(coordinate_1) && @player_board.cells["#{coordinate_1}"].empty?
        
        end
        # coordinate_2 = gets.chomp.upcase
        # puts ">"
        # coordinate_3 = gets.chomp.upcase
      else
        puts "You selected #{input}. Invalid Input."

      end

  end
end

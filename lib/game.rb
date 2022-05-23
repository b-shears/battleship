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
      end
  end

  def player_ship_placement

    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render
    puts "Enter the squares for the Cruiser (3 spaces):"
    puts ">" ["A1", "A2", "A3"]

        @coordinate_array = []
        coordinate_1 = gets.chomp.upcase

        if valid_input?(coordinate_1)
          @coordinate_array << coordinate_1
        else
          puts "Incorrect coordinate, please enter valid coordinate for #{coordinate_1}"

        end

    #     coordinate_2 = gets.chomp.upcase
    #
    #     if valid_input?(coordinate_2)
    #       @coordinate_array << coordinate_2
    #     else
    #       puts "Incorrect coordinate, please enter valid coordinate for #{coordinate_2}"
    #
    #     end
    #
    #     coordinate_3 = gets.chomp.upcase
    #
    #     if valid_input?(coordinate_3)
    #       @coordinate_array << coordinate_3
    #     else
    #       puts "Incorrect coordinate, please enter valid coordinate for #{coordinate_3}"
    #
    #     end
    #
    #       @player_board.valid_placement?(cruiser, ["A1", " ", " "])
    #         puts "You selected #{input}. Invalid Input."
    #     # coordinate_2 = gets.chomp.upcase
    #     # puts ">"
    #     # coordinate_3 = gets.chomp.upcase
    #
    # end
    #
    #   def valid_input?(coordinate)
    #     @player_board.valid_coordinate?(coordinate_1) && @player_board.cells["#{coordinate_1}"].empty?
    #
    #   end
  end
end

class Game

  attr_reader :player_board, :computer_board

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def start
  puts `clear`
  puts "Welcome to BATTLESHIP"
  puts "Enter p to play. Enter q to quit."

  input = gets.chomp.downcase

  if input == "q"
    puts `clear`
    puts "You selected #{input}. Walk the Plank!"

  elsif input == "p"
    puts `clear`
    puts "Game On!"

    computer_ship_placement
    player_ship_placement

    #user/computer turns go here

    end
  end

  def computer_ship_placement

    x = @computer_board.cells.keys.sample(@cruiser.length)

    until @computer_board.valid_placement?(@cruiser, x) == true do
      x = @computer_board.cells.keys.sample(@cruiser.length)
    end

    @computer_board.place(@cruiser, x)

    x = @computer_board.cells.keys.sample(@submarine.length)

    until @computer_board.valid_placement?(@submarine, x) == true do
      x = @computer_board.cells.keys.sample(@submarine.length)
    end

    @computer_board.place(@submarine, x)
  end

  def player_ship_placement
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render
    puts "Enter the squares for the Cruiser (3 spaces):"
    puts '>'
    x = gets.chomp.upcase.split

    # require 'pry'; binding.pry
    until @player_board.valid_coordinate?(x[0]) && @player_board.valid_coordinate?(x[1]) && @player_board.valid_coordinate?(x[2]) && @player_board.valid_placement?(@cruiser, x)
      puts "Those are invalid coordinates. Please try again:"
      x = gets.chomp.upcase.split
    end

    @player_board.place(@cruiser, x)
    puts @player_board.render(true)

    puts "Enter the squares for the Submarine (2 spaces):"
    y = gets.chomp.upcase.split

    until @player_board.valid_coordinate?(y[0]) && @player_board.valid_coordinate?(y[1]) && @player_board.valid_placement?(@submarine, y)
      puts "Those are invalid coordinates. Please try again:"
      y = gets.chomp.upcase.split
    end

    @player_board.place(@submarine, y)
    puts @player_board.render(true)
  end

#turns

end # <= this one ends the whole class
#=====================================================================================================

class Game
  attr_reader :player_board, :computer_board

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_sub = Ship.new("Submarine", 2)

    @player_alive = true
    @computer_alive = true
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

    until @computer_alive == false || @player_alive == false do
      display
      player_shot
      computer_shot
      display
      end
    end

    game_over

    start
  end

  def computer_ship_placement
    comp_coord_selection = @computer_board.cells.keys.sample(@comp_cruiser.length)

    until @computer_board.valid_placement?(@comp_cruiser, comp_coord_selection) == true do
      comp_coord_selection = @computer_board.cells.keys.sample(@comp_cruiser.length)
    end

    @computer_board.place(@comp_cruiser, comp_coord_selection)

    comp_coord_selection = @computer_board.cells.keys.sample(@comp_sub.length)

    until @computer_board.valid_placement?(@comp_sub, comp_coord_selection) == true do
      comp_coord_selection = @computer_board.cells.keys.sample(@comp_sub.length)
    end

    @computer_board.place(@comp_sub, comp_coord_selection)
  end

  def player_ship_placement
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render
    puts "Enter the squares for the Cruiser (3 spaces):"
    puts '>'
    player_coord_selection = gets.chomp.upcase.split

    until @player_board.valid_coordinate?(player_coord_selection[0]) && @player_board.valid_coordinate?(player_coord_selection[1]) && @player_board.valid_coordinate?(player_coord_selection[2]) && @player_board.valid_placement?(@cruiser, player_coord_selection)
      puts "Those are invalid coordinates. Please try again:"
      player_coord_selection = gets.chomp.upcase.split
    end

    @player_board.place(@cruiser, player_coord_selection)
    puts @player_board.render(true)

    puts "Enter the squares for the Submarine (2 spaces):"
    player_coord_selection = gets.chomp.upcase.split

    until @player_board.valid_coordinate?(player_coord_selection[0]) && @player_board.valid_coordinate?(player_coord_selection[1]) && @player_board.valid_placement?(@submarine, player_coord_selection)
      puts "Those are invalid coordinates. Please try again:"
      player_coord_selection = gets.chomp.upcase.split
    end

    @player_board.place(@submarine, player_coord_selection)
    puts @player_board.render(true)
    puts `clear`
  end

  def display
    puts `clear`
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render(true)
    puts "==============PLAYER BOARD=============="
    puts @player_board.render(true)
  end

  def player_shot
    puts "Enter the coordinate for your shot:"
    coordinate = gets.chomp.upcase

    until @computer_board.valid_coordinate?(coordinate)
      puts "Please enter a valid coordinate:"
      coordinate = gets.chomp.upcase
    end

    cell = @computer_board.cells[coordinate]
    ship = cell.ship
    @computer_board.cells[coordinate].fire_upon
    answer = ""
    if @computer_board.cells[coordinate].empty?
      answer = "miss"
    else
      answer = "hit"
    end

    if @comp_cruiser.sunk? && @comp_sub.sunk?
      @computer_alive = false
    end

    puts "Your shot on #{coordinate} was a #{answer}."

    sleep(3)
    puts `clear`
  end

  def computer_shot
    coordinate = @player_board.cells.keys.sample
    until @player_board.cells[coordinate].fired_upon? == false do
      coordinate = @player_board.cells.keys.sample
    end
    @player_board.cells[coordinate].fire_upon

    if @player_board.cells[coordinate].empty?
      answer = "miss"
    else
      answer = "hit"
    end

    if @cruiser.sunk? && @submarine.sunk?
      @player_alive = false
    end

    puts "My shot on #{coordinate} was a #{answer}."
  end

  def game_over
    if @comp_cruiser.sunk? && @comp_sub.sunk?
      puts "You won! You land-lubber, lily-livered, scallywag!"
    end

    if @cruiser.sunk? && @submarine.sunk?
      puts "Go live with the bottom feeders! This is my sea now!"
    end
    @player_board = Board.new
    @computer_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_sub = Ship.new("Submarine", 2)

    @player_alive = true
    @computer_alive = true

    sleep(5)
  end
end

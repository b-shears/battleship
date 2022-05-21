class Board
  attr_reader :cells
  def initialize
    @cells = {
       "A1" => Cell.new("A1"),
       "A2" => Cell.new("A2"),
       "A3" => Cell.new("A3"),
       "A4" => Cell.new("A4"),
       "B1" => Cell.new("B1"),
       "B2" => Cell.new("B2"),
       "B3" => Cell.new("B3"),
       "B4" => Cell.new("B4"),
       "C1" => Cell.new("C1"),
       "C2" => Cell.new("C2"),
       "C3" => Cell.new("C3"),
       "C4" => Cell.new("C4"),
       "D1" => Cell.new("D1"),
       "D2" => Cell.new("D2"),
       "D3" => Cell.new("D3"),
       "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
      if @cells[coordinate]
        true
      else
        false
      end
  end

  def valid_placement?(ship, coordinates)
    valid_length(ship, coordinates) &&
    consecutive_coordinates(coordinates)
  end

  def valid_length(ship, coordinates)
    ship.length == coordinates.length
  end

  def consecutive_coordinates(coordinates)
    #numbers are consecutive and letters are all the same or
    #letters are consecutive, numbers are the same
    #numbers is array because of map
    letters = []
    numbers = []

    coordinates.each do |coordinate|
      letters << coordinate[0].ord
      numbers << coordinate[-1].to_i
    end

    if letters.uniq.length == 1 #letters are the same
      #are numbers consecutive? returns true/false
      number_consecutive = numbers.each_cons(2).all? do |a,b|
         a + 1 == b
      end

    elsif numbers.uniq.length == 1 #numbers are same
      letter_consecutive = letters.each_cons(2).all? do |a,b|
        a + 1 == b
      end
    else
      false
    end
    #[1,2,4]
    #each_cons gives us [[1,2][2,4]]
    #first time through [1,2]
    #[1, 2] true
    #second time throuhg [2,4]
    #[2, 4] false
    #all? (looking at all true) true false

    #[1,2,3]
    #each_cons gives us [[1,2][2,3]]
    #first time through [1,2]
    #[1,2] true
    #second time through [2,3]
    #[2,3] true
    #all? true true is yes
  end

  def place(ship, coordinates)
    

  end

end

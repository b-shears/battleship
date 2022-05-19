class Cell
  attr_reader :coordinate,
              :ship


  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship_name)
    @ship = ship_name
  end

  def fired_upon?
    if @ship == nil
      "."
    else
    @ship.length != @ship.health
  end

  end

  def fire_upon
    @ship.hit
  end

  def render
  
    if fired_upon? == false
      "."
    end
  end

end

class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon


  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false

  end

  def empty?
    @ship == nil
  end

  def place_ship(ship_name)
    @ship = ship_name
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if empty? == false
      @ship.hit
    elsif empty? == true
      @fired_upon
    end
  end

  def render(display_ship = false)

    if display_ship == true && empty? == false && @fired_upon == false
      "S"
   elsif empty? && @fired_upon == true
      "M"
    elsif empty? || @fired_upon == false
      "."
    end
    

  end
end

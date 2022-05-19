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

  # def fired_upon?
  #   # if @ship = nil
  #   #   "."
  #   # else
  #   @ship.length != @ship.health
  #   end



  def fire_upon
    @fired_upon = true
    if empty? == false
      @ship.hit
    elsif empty? == true
      @fired_upon
    end
  end

  def render
    if empty? && @fired_upon == false
      "."
    elsif empty? == true && @fired_upon == true
      "M"
    end
  end
end

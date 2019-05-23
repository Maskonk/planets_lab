class StarSystem

  attr_reader :name, :planets

  def initialize(name, planets)
    @name = name
    @planets = planets
  end

  def planet_names()
    return @planets.map { |planet| planet.name}
  end

  def get_planet_by_name(name)
    return @planets.find { |planet| planet.name == name}
  end

  def get_largest_planet()
    return @planets.reduce() { |size, planet| size.diameter > planet.diameter ? size : planet}
  end

  def get_smallest_planet()
    return @planets.reduce() { |size, planet| size.diameter < planet.diameter ? size : planet}
  end

  def get_planets_with_no_moons()
    return @planets.find_all { |planet| planet.number_of_moons == 0}
  end

  def get_planets_with_more_moons(moons)
    a = @planets.find_all { |planet| planet.number_of_moons > moons }
     b = a.map { | planet | planet.name}
    return b
  end

  def get_number_of_planets_closer_than(distance)
    return @planets.find_all { |planet| planet.distance_from_sun < distance }.count
  end

  def get_total_number_of_moons()
    return @planets.reduce(0) { |moons, planet| moons += planet.number_of_moons}
  end

  def get_planet_names_sorted_by_increasing_distance_from_sun()
    apples =  @planets.sort { |planet1, planet2| planet1.distance_from_sun <=> planet2.distance_from_sun}
    apples.map!{| planet | planet.name}
  end

  def get_planet_names_sorted_by_size_decreasing()
    apples =  @planets.sort { |planet2, planet1| planet1.diameter <=> planet2.diameter}
    apples.map!{| planet | planet.name}
  end


end

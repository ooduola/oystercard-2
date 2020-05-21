class Station

  attr_reader :name
  attr_reader :zone

  def initialize(station_name, station_zone) 
    @name = station_name
    @zone = station_zone
  end

end
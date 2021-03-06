class Route
  attr_reader :start_station, :end_station, :intermediate_stations

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @intermediate_stations = []
  end

  def add_station(station)
    @intermediate_stations.push(station)
  end

  def remove_station(station)
    @intermediate_stations.delete(station)
  end

  def stations_list
    all_stations = [@start_station].concat(@intermediate_stations).push(@end_station)
  end
end
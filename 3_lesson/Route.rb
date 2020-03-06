class Route
  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @intermediate_stations = []
  end

  def add_station(station)
    @intermediate_stations.push(station)
  end

  def delete_station(station_name)
    @intermediate_stations.each do |station|
      if station.name == station_name
        @intermediate_stations.delete(station)
        break
      end
    end
  end

  def stations_list
    all_stations = @intermediate_stations
    all_stations.push(@start_station, @end_station)
    all_stations.each{ |station| puts "Station: #{station.name}." }
  end
end
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

  def remove_station(station_to_delete)
    @intermediate_stations.each do |station|
      if station == station_to_delete
        @intermediate_stations.delete(station)
        break
      end
    end
  end

  def stations_list
    all_stations = [@start_station].concat(@intermediate_stations).push(@end_station)
    all_stations.each{ |station| puts "Station: #{station.name}." }
  end
end
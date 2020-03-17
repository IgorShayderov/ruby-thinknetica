# frozen_string_literal: true

module StationMethods
  def add_station(input)
    objects = input.scan(/(?<=-)\w+/)
    route = objects[0]
    station = objects[1]

    return false unless exists?({
                                  route: route,
                                  station: station
                                })
    if @routes[route].stations_list.include?(@stations[station])
      return puts "Route #{route} already have #{station} station."
    end

    @routes[route].add_station(@stations[station])
    puts "Station #{station} has been added to route #{route}."
  end

  def remove_station(input)
    objects = input.scan(/(?<=-)\w+/)
    route = objects[0]
    station = objects[1]

    return false unless exists?({
                                  route: route,
                                  station: station
                                })
    unless @routes[route].stations_list.include?(@stations[station])
      return puts "You don't have #{station} on a #{route} route."
    end

    @routes[route].remove_station(@stations[station])
    puts "Station #{station} has been removed from route #{route}."
  end

  def next_station(input)
    train = /(?<=-)\w+/.match(input).to_s

    return false unless exists?({ train: train })

    @trains[train].next_station
  end

  def previous_station(input)
    train = /(?<=-)\w+/.match(input).to_s

    return false unless exists?({ train: train })

    @trains[train].previous_station
  end

  def station_list(input)
    route = /(?<=-)\w+/.match(input).to_s

    return false unless exists?({ route: route })

    @routes[route].station_list
  end

  def stations_info
    @stations.each do |_key, station|
      station.each_train do |train|
        puts "Train number #{train.number},type #{train.type},carriages #{train.carriages.length}."
        train.each_carriage do |carriage, num = 1|
          num += 1

          if carriage.type == 'cargo'
            carriage_info = "capacity: #{carriage.capacity}, used: #{carriage.used_capacity}."
          elsif carriage.type == 'passenger'
            carriage_info = "seats #{carriage.capacity}, occupied_seats: #{carriage.used_capacity}"
          end

          puts "Carriage number #{num}, type #{carriage.type}, #{carriage_info}"
        end
      end
    end
  end
end

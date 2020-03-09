require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'

def check_for_existance(instances)
# рефакторинг повторяющихся return'ов
  case instances
  when instances.has_key?(:route)
    return puts "Can't find route #{route} in the routes list." if !routes.has_key?(instances[:route])
  when instances.has_key?(:station)
    return puts "Can't find station #{station} in the stations list." if !stations.has_key?(instances[:station])
  when instances.has_key?(:train)
    return puts "Can't find train #{train} in the trains list." if !trains.has_key?(instances[:train])
  when instances.has_key?(:carriage)
    return puts "Can't find carriage #{carriage} in the carriages list." if !carriages.has_key?(instances[:carriage])
  end
end

stations = {}
trains = {}
routes = {}
carriages = {}

trains["train1"] = CargoTrain.new(666)
trains["train2"] = PassengerTrain.new(333)
trains["train3"] = PassengerTrain.new(999)
trains["train888"] = CargoTrain.new(888)

stations["station1"] = Station.new("Kaliningrad")
stations["station2"] = Station.new("Easter Island")
stations["station3"] = Station.new("Moscow")
stations["station4"] = Station.new("Raushen")
stations["station5"] = Station.new("Zero City")

routes["route1"] = Route.new(stations["station1"], stations["station2"])
routes["route2"] = Route.new(stations["station3"], stations["stations4"])

carriages["carriage1"] = CargoCarriage.new
carriages["carriage2"] = PassengerCarriage.new

puts "Welcome. Type 'help' for commands info."

loop do
  input = gets.chomp

  case input
  when "help"
    puts "---------------------------------------------------------------------"
    puts "Avaliable commands:"
    puts "create -object (arg1, arg2)     | Creates new object."
    puts "Avaliable objects: station, train, route."
    puts "Train have (number) and (type) arguments."
    puts "Station have (name) argument."
    puts "Route have (start_station) and (end_station) arguments."
    puts "Arguments must be in parentheses."
    puts "-route add station -station    | Adding station to the route."
    puts "-route remove station -station | Removing station from the route."
    puts "-train set -route              | Setting route to the train."
    puts "-train add -carriage           | Adding carriage to the train."
    puts "-train remove -carriage        | Removing carriage from the train."
    puts "-train next station            | Move train to the next station."
    puts "-train previous station        | Move train to the previous station."
    puts "-route station list            | List of all stations on the route."
    puts "-station train list            | List of all trains on the station."
    puts "instances -object              | List of all, created by you, objects."
    puts "Avaliable objects: stations, trains, routes."
    puts "exit                           | Exit from program."
  when /create\s-+\w+\s+\(.+\)/
    object = /(?<=-)\w+/.match(input).to_s
    arguments = /(?<=\()\w+(,*\s*\w+)*(?=\))/.match(input).to_s.split(',').each{ |arg| arg.strip! }

    puts "Pick name for instance."
    name = gets.chomp

    case object
    when "train"
      train_number = arguments[0]
      train_type = arguments[1]

      trains[name] = train_type == "cargo" ? CargoTrain.new(train_number) : PassengerTrain.new(train_number)
      puts "Train #{name} has been created."
    when "station"
      station_name = arguments[0]

      stations[name] = Station.new(station_name)
      puts "Station #{name} has been created."
    when "route"
      start_station = stations[arguments[0]]
      end_station = stations[arguments[1]]

      routes[name] = Route.new(start_station, end_station)
      puts "Route #{name} has been created."
    end
  when /-\w+\s+add\sstation\s+-\w+/
    objects = input.scan(/(?<=-)\w+/)
    route = objects[0]
    station = objects[1]

    check_for_existance({
      route: route,
      station: station,
    })
    return puts "Route #{route} already have #{station} station." if routes[route].station_list.include?(stations[station])

    routes[route].add_station(stations[station])
    puts "Station #{station} has been added to route #{route}."
  when /-\w+\s+remove\sstation\s+-\w+/
    objects = input.scan(/(?<=-)\w+/)
    route = objects[0]
    station = objects[1]

    check_for_existance({
      route: route,
      station: station,
    })
    return puts "You don't have #{station} on a #{route} route." if !routes[route].station_list.include?(stations[station])

    routes[route].remove_station(station)
    puts "Station #{station} has been removed from route #{route}."
  when /-\w+\s+set\s+-\w+/
    objects = input.scan(/(?<=-)\w+/)
    train = objects[0]
    route = objects[1]

    check_for_existance({
      route: route,
      train: train,
    })

    trains[train].set_route(route)
    puts "Route #{route} has been set to train #{train}."
  when /-\w+\s+add\s+-\w+/
    objects = input.scan(/(?<=-)\w+/)
    train = objects[0]
    carriage = objects[1]

    check_for_existance({
      train: train,
      carriage: carriage,
    })
    return puts "You already have #{carriage} carriage." if trains[train].carriages.include?(carriages[carriage])

    trains[train].add_carriage(carriage)
  when /-\w+\sremove\s+-\w+/
    objects = input.scan(/(?<=-)\w+/)
    train = objects[0]
    carriage = objects[1]

    check_for_existance({
      train: train,
      carriage: carriage,
    })
    return puts "You don't have #{carriage} carriage." if !trains[train].carriages.include?(carriages[carriage])

    trains[train].remove_carriage(carriage)
  when /-\w+\s+next station/
    train = /(?<=-)\w+/.match(input).to_s

    check_for_existance({ train: train })

    trains[train].next_station
  when /-\w+\s+previous station/
    train = /(?<=-)\w+/.match(input).to_s

    check_for_existance({ train: train })

    trains[train].previous_station
  when /-\w+\s+station list/
    route = /(?<=-)\w+/.match(input).to_s

    check_for_existance({ route: route })

    routes[route].station_list
  when /-\w+\s+train list/
    station = /(?<=-)\w+/.match(input).to_s

    check_for_existance({ station: station })

    stations[station].trains_inside
  when /instances\s+-\w+/
    object = /(?<=-)\w+/.match(input).to_s

    case object
    when "stations"
      puts stations
    when "trains"
      puts trains
    when "routes"
      puts routes
    end
  when "exit"
    puts "Goodbye."
    break
  else
    puts "Unknown command. Type 'help' for commands info."
  end
end

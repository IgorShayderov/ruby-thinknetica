class Interface

  def initialize
    @stations = {}
    @trains = {}
    @routes = {}
    @carriages = {}
  end

  def start
    puts "Welcome. Type 'help' for commands info."
    loop do
      input = gets.chomp

      case input
      when "help"
        commands_list
      when /create\s-+\w+\s+\(.+\)/
        create_object(input)
      when /-\w+\s+add\sstation\s+-\w+/
        add_station(input)
      when /-\w+\s+remove\sstation\s+-\w+/
        remove_station(input)
      when /-\w+\s+set\s+-\w+/
        set_route(input)
      when /-\w+\s+add\s+-\w+/
        add_carriage(input)
      when /-\w+\sremove\s+-\w+/
        remove_carriage(input)
      when /-\w+\s+next station/
        next_station(input)
      when /-\w+\s+previous station/
        previous_station(input)
      when /-\w+\s+station list/
        station_list(input)
      when /-\w+\s+train list/
        train_list(input)
      when /instances\s+-\w+/
        show_instances(input)
      when "exit"
        puts "Goodbye."
        break
      else
        puts "Unknown command. Type 'help' for commands info."
      end
    end
  end

  private

  def check_for_existance(instances)
    if instances.has_key?(:route)
      return puts "Can't find route #{instaces[:route]} in the routes list." if !@routes.has_key?(instances[:route])
    end
    if instances.has_key?(:station)
      return puts "Can't find station #{instaces[:station]} in the stations list." if !@stations.has_key?(instances[:station])
    end
    if instances.has_key?(:train)
      return puts "Can't find train #{instaces[:train]} in the trains list." if !@trains.has_key?(instances[:train])
    end
    if instances.has_key?(:carriage)
      return puts "Can't find carriage #{instaces[:carriage]} in the carriages list." if !@carriages.has_key?(instances[:carriage])
    end
  end

  def commands_list
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
  end

  def create_object(input)
    object = /(?<=-)\w+/.match(input).to_s
    arguments = /(?<=\()\w+(,*\s*\w+)*(?=\))/.match(input).to_s.split(',').each{ |arg| arg.strip! }

    puts "Pick name for instance."
    name = gets.chomp

    case object
    when "train"
      train_number = arguments[0]
      train_type = arguments[1]

      @trains[name] = train_type == "cargo" ? CargoTrain.new(train_number) : PassengerTrain.new(train_number)
      puts "Train #{name} has been created."
    when "station"
      station_name = arguments[0]

      @stations[name] = Station.new(station_name)
      puts "Station #{name} has been created."
    when "route"
      start_station = stations[arguments[0]]
      end_station = stations[arguments[1]]

      @routes[name] = Route.new(start_station, end_station)
      puts "Route #{name} has been created."
    end
  end

  def add_station(input)
    objects = input.scan(/(?<=-)\w+/)
    route = objects[0]
    station = objects[1]

    check_for_existance({
      route: route,
      station: station,
    })
    return puts "Route #{route} already have #{station} station." if @routes[route].stations_list.include?(@stations[station])

    @routes[route].add_station(@stations[station])
    puts "Station #{station} has been added to route #{route}."
  end

  def remove_station(input)
    objects = input.scan(/(?<=-)\w+/)
    route = objects[0]
    station = objects[1]

    check_for_existance({
      route: route,
      station: station,
    })
    return puts "You don't have #{station} on a #{route} route." if !@routes[route].stations_list.include?(@stations[station])

    @routes[route].remove_station(@stations[station])
    puts "Station #{station} has been removed from route #{route}."
  end

  def set_route(input)
    objects = input.scan(/(?<=-)\w+/)
    train = objects[0]
    route = objects[1]

    check_for_existance({
      route: route,
      train: train,
    })

    @trains[train].set_route(route)
    puts "Route #{route} has been set to train #{train}."
  end

  def add_carriage(input)
    objects = input.scan(/(?<=-)\w+/)
    train = objects[0]
    carriage = objects[1]

    check_for_existance({
      carriage: carriage,
      train: train,
    })

    return puts "You already have #{carriage} carriage." if @trains[train].carriages.include?(@carriages[carriage])

    @trains[train].add_carriage(carriage)
  end

  def remove_carriage(input)
    objects = input.scan(/(?<=-)\w+/)
    train = objects[0]
    carriage = objects[1]

    check_for_existance({
      carriage: carriage,
      train: train,
    })
    return puts "You don't have #{carriage} carriage." if !@@trains[train].carriages.include?(@carriages[carriage])

    @trains[train].remove_carriage(carriage)
  end

  def next_station(input)
    train = /(?<=-)\w+/.match(input).to_s

    check_for_existance({train: train})

    @trains[train].next_station
  end

  def previous_station(input)
    train = /(?<=-)\w+/.match(input).to_s

    check_for_existance({train: train})

    @trains[train].previous_station
  end

  def station_list(input)
    route = /(?<=-)\w+/.match(input).to_s

    check_for_existance({route: route})

    @routes[route].station_list
  end

  def train_list(input)
    station = /(?<=-)\w+/.match(input).to_s

        check_for_existance({station: station})

    @stations[station].trains_inside
  end

  def show_instances(input)
    object = /(?<=-)\w+/.match(input).to_s

    case object
    when "stations"
      puts @stations
    when "trains"
      puts @trains
    when "routes"
      puts @routes
    end
  end

end
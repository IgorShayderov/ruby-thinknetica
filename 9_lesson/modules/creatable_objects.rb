# frozen_string_literal: true

module CreatableObjects
  def create_train(arguments, name)
    train_number = arguments[0]
    train_type = arguments[1]

    if train_type == 'cargo'
      @trains[name] = CargoTrain.new(train_number)
    elsif train_type == 'passenger'
      @trains[name] = PassengerTrain.new(train_number)
    else
      puts 'Wrong type of train. Must be cargo of passenger.'
      return false
    end

    puts "Train #{name} has been created."
  end

  def create_station(arguments, name)
    station_name = arguments[0]

    @stations[name] = Station.new(station_name)
    puts "Station #{name} has been created."
  end

  def create_route(arguments, name)
    start_station = stations[arguments[0]]
    end_station = stations[arguments[1]]

    [start_station, end_station].each { |station| exists?(station: station) }

    @routes[name] = Route.new(start_station, end_station)
    puts "Route #{name} has been created."
  end

  def create_carriage(arguments, name)
    carriage_type = arguments[0]
    carriage_load = arguments[1]

    if carriage_type == 'cargo'
      @carriages[name] = CargoCarriage.new('cargo', carriage_load)
    elsif carriage_type == 'passenger'
      @carriages[name] = PassengerCarriage.new('passenger', carriage_load)
    else
      puts 'Wrong type of carriage. Must be cargo of passenger.'
      return false
    end

    puts "Carriage #{name} has been created."
  end
end

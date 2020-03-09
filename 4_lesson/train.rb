class Train
  attr_reader :type, :number, :carriages, :station, :route, :cariages, :speed

  def initialize(number, type)
    @number = number
    @type = type
    @carriages = []
    @speed = 0
  end

  def begin_movement
    @speed = 50
  end

  def stop_train
    @speed = 0
  end

  def get_current_station
    puts "Current station is #{station.name}"
  end

  def set_route(route)
      @route = route
      @station = route.start_station
      @route.start_station.push(self)
  end

  def get_next_station
    if @route.stations_list.length === (current_station_index + 1)
      puts "You are in the end point."
    else
      puts "Following station is #{@route.stations_list[current_station_index + 1].name}"
    end
  end

  def get_previous_station
    if current_station_index === 0
      puts "You are in the start point."
    else
      puts "Previous station is #{@route.stations_list[current_station_index - 1].name}"
    end
  end

  def next_station
    if @route.stations_list.length === (current_station_index + 1)
      puts "You are in the end point. You can't go further."
    else
      @route.stations_list[current_station_index + 1].take_train_in(self)
      @route.stations_list[current_station_index].dispatch_train(self)
      @station = @route.stations_list[current_station_index + 1]
    end
  end

  def previous_station
    if current_station_index === 0
      puts "You are in the start point. You can't go backwards."
    else
      @route.stations_list[current_station_index - 1].take_train_in(self)
      @route.stations_list[current_station_index].dispatch_train(self)
      @station = @route.stations_list[current_station_index - 1]
    end
  end

  protected
# пользователь не должен по своему усмотрению менять скорость(хотя пока что это ни на что не влияет)
  attr_writer :speed
# получение индекса это служебный метод, пользователю он как минимум не нужен
  def current_station_index
    @route.stations_list.index(@station)
  end

end

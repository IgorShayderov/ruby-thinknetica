class Train
  attr_accessor :speed
  attr_reader :type, :number, :carriage_count, :station, :route

  def initialize(number, type, carriage_count)
    @number = number
    @type = type
    @carriage_count = carriage_count
    @speed = 0
  end

  def stop_train
    @speed = 0
  end

  def get_current_station
    puts "Current station is #{station.name}"
  end

  def add_carriage
    if speed == 0
      @carriage_count += 1
      puts "Carriage added."
    else
      puts "You should stop to add carriage."
    end
  end

  def remove_carriage
    if speed == 0
      @carriage_count -= 1
      puts "Carriage removed."
    else
      puts "You should stop to add carriage."
    end
  end

  def set_route(route)
      @route = route
      @station = route.start_station
  end

  def current_station_index
    @route.stations_list.index(@station)
  end

  def get_following_station
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

  def move_to_following_station
    if @route.stations_list.length === (current_station_index + 1)
      puts "You are in the end point. You can't go further."
    else
      @station = @route.stations_list[current_station_index + 1]
    end
  end

  def move_to_previous_station
    if current_station_index === 0
      puts "You are in the start point. You can't go backwards."
    else
      @station = @route.stations_list[current_station_index - 1]
    end
  end

end

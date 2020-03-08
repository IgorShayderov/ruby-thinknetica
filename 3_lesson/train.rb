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

  def get_following_station
    following_station = next_station
    puts following_station == @station ? "There is no following station" : following_station.name
  end

  def get_previous_station
    previous_station = next_station("previous")
    puts previous_station == @station ? "There is no previous station." : previous_station.name
  end

  def move_to_following_station
    following_station = self.next_station()
    if following_station === @station
      puts "You can't go furter than end station."
    else @station = following_station
    end
  end

  def move_to_previous_station
    previous_station = self.next_station("previous")
    if previous_station === @station
      puts "You can't go furter than start station."
    else @station = previous_station
    end
  end

  private

  def next_station(direction="following")
    options = {
      start_point: direction == "previous" ? @route.end_station : @route.start_station,
      end_point: direction == "previous" ? @route.start_station : @route.end_station,
      action: direction == "previous" ? -1 : 1,
    }

    if @station == options[:start_point]
      return @route.intermediate_stations.length == 0 ? options[:end_point] : @route.intermediate_stations[0]
    elsif @station == options[:end_point]
      return @station
    else
      current_station_index = @route.intermediate_stations.index(@station)
      return @route.intermediate_stations.length > current_station_index ?
        @route.intermediate_stations[current_station_index + options[:action]]
        : options[:end_point]
    end
  end

end

class Train
  attr_reader :type, :number, :carriages, :station, :route, :cariages, :speed
  include Manufacturer
  include InstanceCounter

  PATTERN = /\w{3}-*\w{2}/

  inheritable_attributes :instance_counter
  @instance_counter = 0

  @@trains = {}

  class << self
    def find(number)
      @@trains[number] || nil
    end
  end

  def initialize(number, type)
    @number = number
    validate!
    @type = type
    @carriages = []
    @speed = 0
    increment_instance_counter
    @@trains[self.number] = self
  end

  def begin_movement
    @speed = 50
  end

  def stop_train
    @speed = 0
  end

    def add_carriage(carriage)
    if speed > 0
      puts "You should stop to add carriage."
    else
      @carriages.push(carriage)
      puts "Carriage added."
    end
  end

  def remove_carriage(carriage)
    if speed > 0
      puts "You should stop to remove carriage."
    else 
      @carriages.delete(carriage)
      puts "Carriage removed."
    end
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

  def carriages_action
    @carriages.each { |carriage| yield(carriage) }
  end

  def validate!
      raise ArgumentError, "Wrong number for train. Number should consist of 3 letters/digits then optional '-' and then 2 more letters/digits." if !(number =~ PATTERN)
  end

end

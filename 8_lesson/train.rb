# frozen_string_literal: true

class Train
  attr_reader :type, :number, :carriages, :station, :route, :cariages, :speed
  include Manufacturer
  include InstanceCounter

  PATTERN = /\w{3}-*\w{2}/.freeze

  inheritable_attributes :instance_counter
  @instance_counter = 0

  class << self
    def find(number)
      @trains[number] || nil
    end

    def trains
      @trains ||= {}
    end
  end

  def initialize(number, type)
    @number = number
    validate!
    @type = type
    @carriages = []
    @speed = 0
    increment_instance_counter
    self.class.trains[self.number] = self
  end

  def begin_movement
    @speed = 50
  end

  def stop_train
    @speed = 0
  end

  def add_carriage(carriage)
    if speed.positive?
      puts 'You should stop to add carriage.'
    else
      @carriages.push(carriage)
      puts 'Carriage added.'
    end
  end

  def remove_carriage(carriage)
    if speed.positive?
      puts 'You should stop to remove carriage.'
    else
      @carriages.delete(carriage)
      puts 'Carriage removed.'
    end
  end

  def current_station
    puts "Current station is #{station.name}"
  end

  def pick_route(route)
    @route = route
    @station = route.start_station
    @route.start_station.push(self)
  end

  def show_next_station
    if @route.stations_list.length == (current_station_index + 1)
      puts 'You are in the end point.'
    else
      puts "Following station is #{@route.stations_list[current_station_index + 1].name}"
    end
  end

  def show_previous_station
    if current_station_index.zero?
      puts 'You are in the start point.'
    else
      puts "Previous station is #{@route.stations_list[current_station_index - 1].name}"
    end
  end

  def next_station
    if @route.stations_list.length == (current_station_index + 1)
      puts "You are in the end point. You can't go further."
    else
      move_train('forward')
    end
  end

  def previous_station
    if current_station_index.zero?
      puts "You are in the start point. You can't go backwards."
    else
      move_train('backward')
    end
  end

  def move_train(direction)
    station_index = direction == 'forward' ? 1 : -1

    @route.stations_list[current_station_index + station_index].take_train_in(self)
    @route.stations_list[current_station_index].dispatch_train(self)
    @station = @route.stations_list[current_station_index + station_index]
  end

  def each_carriage
    @carriages.each { |carriage| yield(carriage) }
  end

  protected

  attr_writer :speed

  def current_station_index
    @route.stations_list.index(@station)
  end

  def validate!
    raise ArgumentError, 'Wrong number for train.' if number !~ PATTERN
  end
end

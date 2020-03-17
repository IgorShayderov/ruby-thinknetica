# frozen_string_literal: true

class Station
  include InstanceCounter

  PATTERN = /\w+\s*\w+/.freeze

  attr_reader :name, :trains_inside

  class << self
    def all
      @stations_count
    end
  end

  def initialize(name)
    @name = name
    validate!
    @trains_inside = []
  end

  def take_train_in(train)
    @trains_inside.push(train)
  end

  def trains_inside_by_type
    if !@trains_inside.empty?
      cargo_trains = @trains_inside.select { |train| train.type == 'cargo' }
      passenger_trains = @trains_inside.select { |train| train.type == 'passenger' }
      {
        'Cargo trains' => cargo_trains,
        'Passenger trains' => passenger_trains
      }
    else
      @trains_inside
    end
  end

  def dispatch_train(train)
    @trains_inside.delete(train)
  end

  def each_train
    @trains_inside.each { |train| yield(train) }
  end

  protected

  def validate!
    raise ArgumentError, 'Wrong name for station.' if name !~ PATTERN
  end
end

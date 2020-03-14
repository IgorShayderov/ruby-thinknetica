class Station
  include InstanceCounter
  include Validation

    PATTERN = /\w+\s*\w+/

  attr_reader :name, :trains_inside

  @@stations_count = 0

  class << self
    def all
      @@stations_count
    end
  end

  def initialize(name)
    @name = name
    raise if !valid?
    @trains_inside = []
    @@stations_count += 1
  end

  def validate!
    raise ArgumentError, "Wrong name for station." if !(name =~ PATTERN)
  end

  def take_train_in(train)
    @trains_inside.push(train)
  end

  def trains_inside_by_type
    if @trains_inside.length > 0
      cargo_trains = @trains_inside.select{ |train| train.type == "cargo" }
      passenger_trains = @trains_inside.select{ |train| train.type == "passenger" }
      return trains_by_type_list = {
        "Cargo trains" => cargo_trains,
        "Passenger trains" => passenger_trains,
      }
    else
      return @trains_inside
    end
  end

  def dispatch_train(train)
    @trains_inside.delete(train)
  end
end
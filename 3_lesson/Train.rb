# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута

class Train
  attr_accessor :speed
  attr_reader :type, :number

  def initialize(number, type, carriage_count)
    @number = number
    @type = type
    @carriage_count = carriage_count
    @speed = 0
    @route
    @station
  end

  def stop_train
    @speed = 0
  end

  def carriage_count
    @carriage_count
  end

  def carriage_action(action)
    if speed > 0
      if action == 'add'
        @carriage_count += 1
        puts "Carriage added."
      elsif action == 'remove'
        @carriage_count -= 1
        puts "Carriage removed."
      end
    else
      puts "You should stop to add carriage."
    end
  end

  def set_route=(route)
      @route = route
      @station = route.start_station
  end

  def next_station
    if @station == @route.start_station
      @station = @route.intermediate_stations.length == 0 ? @route.end_station : @route.intermediate_stations[0]
    elsif @station == @route.end_station
      puts "You can't go furter than end station."
    else
      current_station_index = @route.intermediate_stations.index(@station)
      @station = @route.intermediate_stations.length > current_station_index ? @route.intermediate_stations[current_station_index + 1] : @route.end_station
    end
  end
end


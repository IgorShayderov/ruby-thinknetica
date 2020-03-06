class Station
  def initialize(name)
    @name = name
    @trains_inside = []
  end

  def take_train_in(train)
    @trains_inside.push(train)
  end

  def trains_list
    @trains_inside.each{ |train| puts "#{train.type} train: #{train.number}." }
  end

  def train_list_by_type(type)
    picked_trains = @trains_inside.select{ |train| train.type == type }
    if picked_trains.length > 0
      puts "#{type} trains"
      picked_trains.each{ |train| puts "Train: #{train.number}"}
    else
      puts "There are no such trains on a station"
    end
  end

  def dispatch_train(train_to_delete)
    @trains_inside.each do |train|
      if train.number == train_to_delete.number
        @trains_inside.delete(train)
        break
      end
    end
  end
end
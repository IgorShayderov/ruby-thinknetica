# frozen_string_literal: true

module TrainMethods
  def add_carriage(input)
    objects = input.scan(/(?<=-)\w+/)
    train = objects[0]
    carriage = objects[1]

    return false unless exists?(carriage: carriage, train: train)

    return puts "You already have #{carriage} carriage." if @trains[train].carriages.include?(@carriages[carriage])

    @trains[train].add_carriage(carriage)
  end

  def remove_carriage(input)
    objects = input.scan(/(?<=-)\w+/)
    train = objects[0]
    carriage = objects[1]

    return false unless exists?(carriage: carriage, train: train)

    return puts "You don't have #{carriage} carriage." unless @@trains[train].carriages.include?(@carriages[carriage])

    @trains[train].remove_carriage(carriage)
  end

  def train_list(input)
    station = /(?<=-)\w+/.match(input).to_s

    return false unless exists?(station: station)

    @stations[station].trains_inside
  end

  def pick_route(input)
    objects = input.scan(/(?<=-)\w+/)
    train = objects[0]
    route = objects[1]

    return false unless exists?(route: route, train: train)

    @trains[train].route(route)
    puts "Route #{route} has been set to train #{train}."
  end
end

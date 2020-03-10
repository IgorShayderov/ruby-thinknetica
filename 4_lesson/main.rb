require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'
require_relative 'interface'

# trains["train1"] = CargoTrain.new(666)
# trains["train2"] = PassengerTrain.new(333)
# trains["train3"] = PassengerTrain.new(999)
# trains["train888"] = CargoTrain.new(888)

# stations["station1"] = Station.new("Kaliningrad")
# stations["station2"] = Station.new("Easter Island")
# stations["station3"] = Station.new("Moscow")
# stations["station4"] = Station.new("Raushen")
# stations["station5"] = Station.new("Zero City")

# routes["route1"] = Route.new(stations["station1"], stations["station2"])
# routes["route2"] = Route.new(stations["station3"], stations["stations4"])

# carriages["carriage1"] = CargoCarriage.new
# carriages["carriage2"] = PassengerCarriage.new

Interface.new.start

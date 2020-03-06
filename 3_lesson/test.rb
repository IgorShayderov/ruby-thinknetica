require_relative 'Train'
require_relative 'Route'
require_relative 'Station'

train1 = Train.new(666, "carriage", 5)
train2 = Train.new(333, "cargo", 1)
train3 = Train.new(999, "cargo", 3)

station1 = Station.new("Kaliningrad")
station2 = Station.new("Easter Island")

route1 = Route.new(station1, station2)

station1.take_train_in(train1)
station1.take_train_in(train2)
station1.take_train_in(train3)
station1.trains_list
station1.dispatch_train(train3)
station1.train_list_by_type("cargo")


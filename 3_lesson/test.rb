require_relative 'train'
require_relative 'route'
require_relative 'station'

train1 = Train.new(666, "passenger", 5)
train2 = Train.new(333, "cargo", 1)
train3 = Train.new(999, "cargo", 3)

station1 = Station.new("Kaliningrad")
station2 = Station.new("Easter Island")
station3 = Station.new("Moscow")

route1 = Route.new(station1, station2)

station1.take_train_in(train1)
station1.take_train_in(train2)
station1.take_train_in(train3)
puts station1.trains_inside
station1.dispatch_train(train3)
puts station1.trains_inside_by_type()

route1.add_station(station3)
route1.stations_list
puts "After delete"
route1.remove_station(station3)
route1.stations_list

puts train1.speed
train1.add_carriage
train1.speed = 50
puts train1.speed
train1.add_carriage
train1.stop_train
train1.remove_carriage

train1.set_route(route1)

train1.get_current_station
train1.get_following_station
train1.get_previous_station
train1.move_to_following_station
train1.get_current_station
train1.move_to_previous_station
train1.get_current_station

puts "-----------------"
train1.get_current_station
train1.get_following_station
train1.move_to_following_station
train1.get_current_station
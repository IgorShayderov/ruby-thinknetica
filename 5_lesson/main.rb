require_relative 'module_manufacturer'
require_relative 'module_instance_counter'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'
require_relative 'interface'

CargoTrain.new(666)
PassengerTrain.new(333)
PassengerTrain.new(999)

p CargoTrain.instance_counter
p PassengerTrain.instance_counter

Interface.new.start

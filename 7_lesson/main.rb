require './modules/module_manufacturer'
require './modules/module_instance_counter'
require './modules/module_validation'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'
require_relative 'interface'

Interface.new.start

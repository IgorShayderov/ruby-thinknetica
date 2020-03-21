# frozen_string_literal: true

require './modules/manufacturer'
require './modules/instance_counter'
require './modules/validation'
require './modules/station_methods'
require './modules/train_methods'
require './modules/creational_methods'
require './modules/creatable_objects'
require './modules/accessors.rb'
require './modules/validations'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'
require_relative 'interface'

# Interface.new.start

train1 = Train.new("123-gk", "cargo")

train1.mileage = 500
train1.pedestrians_killed = 1
train1.mileage = 600
train1.mileage = 800
train1.pedestrians_killed = 5

p train1.mileage_history
p train1.pedestrians_killed_history

p train1.wheels = 123
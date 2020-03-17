# frozen_string_literal: true

require './modules/manufacturer'
require './modules/instance_counter'
require './modules/validation'
require './modules/station_methods'
require './modules/train_methods'
require './modules/creational_methods'
require './modules/creatable_objects'
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

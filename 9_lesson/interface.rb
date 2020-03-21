# frozen_string_literal: true

# rubocop:disable Layout/PerceivedComplexity, Layout/CyclomaticComplexity, Layout/MethodLength, Layout/AbcSize

class Interface
  include StationMethods
  include TrainMethods
  include CreationalMethods
  include CreatableObjects

  def initialize
    @stations = {}
    @trains = {}
    @routes = {}
    @carriages = {}
  end

  def start
    puts "Welcome. Type 'help' for commands info."
    loop do
      input = gets.chomp

      case input
      when 'help'
        commands_list
      when /create\s-+\w+\s+\(.+\)/
        redo unless create_object(input)
      when /-\w+\s+add\sstation\s+-\w+/
        redo unless add_station(input)
      when /-\w+\s+remove\sstation\s+-\w+/
        redo unless remove_station(input)
      when /-\w+\s+pick\s+route\s+-\w+/
        redo unless pick_route(input)
      when /-\w+\s+add\s+-\w+/
        redo unless add_carriage(input)
      when /-\w+\sremove\s+-\w+/
        redo unless remove_carriage(input)
      when /-\w+\s+next station/
        redo unless next_station(input)
      when /-\w+\s+previous station/
        redo unless previous_station(input)
      when /-\w+\s+station list/
        redo unless station_list(input)
      when /-\w+\s+train list/
        redo unless train_list(input)
      when /instances\s+-\w+/
        redo unless show_instances(input)
      when /^\s*stations\s*info\s*$/
        stations_info
      when 'exit'
        puts 'Goodbye.'
        break
      else
        puts "Unknown command. Type 'help' for commands info."
      end
    end
  end

  private

  def exists?(instances)
    if instances.key?(:route) && !@routes.key?(instances[:route])
      puts "Can't find route #{instances[:route]} in the routes list."
      return false
    end
    if instances.key?(:station) && !@stations.key?(instances[:station])
      puts "Can't find station #{instances[:station]} in the stations list."
      return false
    end
    if instances.key?(:train) && !@trains.key?(instances[:train])
      puts "Can't find train #{instances[:train]} in the trains list."
      return false
    end
    if instances.key?(:carriage) && !@carriages.key?(instances[:carriage])
      puts "Can't find carriage #{instances[:carriage]} in the carriages list."
      return false
    end
    true
  end

  def commands_list
    puts '---------------------------------------------------------------------'
    puts ' * Avaliable commands:'
    puts 'create -object (arg1, arg2)     | Creates new object.'
    puts ' * Avaliable objects: station, train, route, carriage.'
    puts ' * Train have (number) and (type) arguments. Type can be cargo or passenger.'
    puts ' * Station have (name) argument.'
    puts ' * Route have (start_station) and (end_station) arguments.'
    puts ' * Carriage have (type) argument and (capacity).'
    puts ' * Arguments must be in parentheses.'
    puts '-route add station -station    | Adding station to the route.'
    puts '-route remove station -station | Removing station from the route.'
    puts '-train pick route -route              | Setting route to the train.'
    puts '-train add -carriage           | Adding carriage to the train.'
    puts '-train remove -carriage        | Removing carriage from the train.'
    puts '-train next station            | Move train to the next station.'
    puts '-train previous station        | Move train to the previous station.'
    puts '-route station list            | List of all stations on the route.'
    puts '-station train list            | List of all trains on the station.'
    puts 'instances -object              | List of all, created by you, objects.'
    puts ' * Avaliable objects: stations, trains, routes, carriages.'
    puts 'stations info'
    puts ' * Consecutive outputs information about each station, including trains inside.'
    puts 'exit                           | Exit from program.'
  end
end

# rubocop:enable Layout/PerceivedComplexity, Layout/CyclomaticComplexity, Layout/MethodLength, Layout/AbcSize

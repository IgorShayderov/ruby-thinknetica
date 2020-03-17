# frozen_string_literal: true

module CreationalMethods
  def create_object(input)
    object = /(?<=-)\w+/.match(input).to_s
    arguments = /(?<=\()\w+-*\w+(,*\s*\w+-*\w+)*(?=\))/.match(input).to_s.split(',').each(&:strip!)

    puts 'Pick name for instance.'
    name = gets.chomp

    case object
    when 'train'
      create_train(arguments, name)
    when 'station'
      create_station(arguments, name)
    when 'route'
      create_route(arguments, name)
    when 'carriage'
      create_carriage(arguments, name)
    end
  rescue ArgumentError => e
    puts e.message
  end

  def show_instances(input)
    object = /(?<=-)\w+/.match(input).to_s

    case object
    when 'stations'
      puts @stations
    when 'trains'
      puts @trains
    when 'routes'
      puts @routes
    end
  end
end

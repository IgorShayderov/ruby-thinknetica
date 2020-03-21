# frozen_string_literal: true

class PassengerTrain < Train
  def initialize(number)
    super(number, 'passenger')
  end

  def add_carriage(carriage)
    if carriage.type != 'passenger'
      puts 'Wrong type of carriage.'
    else
      super(carriage)
    end
  end
end

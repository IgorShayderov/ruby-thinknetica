# frozen_string_literal: true

class CargoTrain < Train
  def initialize(number)
    super(number, 'cargo')
  end

  def add_carriage(carriage)
    if carriage.type != 'cargo'
      puts 'Wrong type of carriage.'
    else
      super(carriage)
    end
  end
end

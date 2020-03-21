# frozen_string_literal: true

class PassengerCarriage < Carriage
  def initialize(capacity)
    super('passenger', capacity)
  end

  def load
    number_of_ocupied_seats = 1
    super(number_of_ocupied_seats, 'All seats are occupied.')
  end
end

class PassengerCarriage < Carriage

  def initialize(capacity)
    super("passenger", capacity)
  end

  def load
    message = "All seats are occupied."
    number_of_ocupied_seats = 1
    super(number_of_ocupied_seats, message)
  end

end
class PassengerCarriage < Carriage

  attr_reader :occupied_seats, :seats_amount

  def initialize(seat_amount)
    @type = "passenger"
    @seats_amount = seats_amount
    @occupied_seats = 0
  end

  def occupy_seat
    if @occupy_seat < @seat_amount
      @occupied_seats += 1
    else
      puts "All seats are occupied."
    end
  end

end
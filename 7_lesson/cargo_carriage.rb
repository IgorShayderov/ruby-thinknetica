class CargoCarriage < Carriage

  attr_reader :capacity, :used_capacity

  def initialize(capacity)
    @type = "cargo"
    @capacity = capacity
    @used_capacity = 0
  end

  def load(capacity)
    if (@capacity - @used_capacity) <= capacity
      @used_capacity += capacity
    else
      puts "Carrriage is overloaded."
    end
  end

end
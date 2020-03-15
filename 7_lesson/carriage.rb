class Carriage
include Manufacturer

  attr_reader :capacity

  def initialize(type, capacity)
    @type = type
    @capacity = capacity
    @used_capacity = 0
  end

  def load(capacity, message)
    if (@capacity - @used_capacity) <= capacity
      @used_capacity += capacity
    else
      puts message
    end
  end

  def free_space
    @capacity - @used_capacity
  end

end
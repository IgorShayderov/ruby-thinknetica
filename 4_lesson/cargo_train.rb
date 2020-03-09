class CargoTrain < Train

  def initialize(number)
    super(number, "cargo")
  end

  def add_carriage(carriage)
    if speed > 0
      puts "You should stop to add carriage."
    elsif carriage.type != "cargo"
      puts "Wrong type of carriage."
    else 
      @carriages.push(carriage)
      puts "Carriage added."
    end
  end

  def remove_carriage(carriage)
    if speed > 0
      puts "You should stop to remove carriage."
    else 
      @carriages.delete(carriage)
      puts "Carriage removed."
    end
  end

end
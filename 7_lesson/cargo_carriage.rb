class CargoCarriage < Carriage

  def initialize(capacity)
    super("cargo", capacity)
  end

  def load(capacity)
    message = "Carrriage is overloaded."
    super(capacity, message)
  end

end
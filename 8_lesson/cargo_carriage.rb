# frozen_string_literal: true

class CargoCarriage < Carriage
  def initialize(capacity)
    super('cargo', capacity)
  end

  def load(capacity)
    super(capacity, 'Carrriage is overloaded.')
  end
end

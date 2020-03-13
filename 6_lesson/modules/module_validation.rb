module Validation

  def valid?
    validate!
    true
  rescue ArgumentError => error
    puts error.inspect
    false
  end

end

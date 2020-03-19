module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def validate(arg, validation_type, *params)
      raise TypeError.new("#{method} is not symbol") unless arg.is_a?(Symbol) && validation_type.is_a?(Symbol)

      case validation_type
      when :presence
        raise TypeError.new("#{arg} should not be empty.") unless !instance_variable_get("@#{arg}").nil?
      when :format
        p instance_variable_get("@#{arg}")
        p self
        raise TypeError.new("You should pass Regexp into params.") unless params[0].class == Regexp
        raise TypeError.new("#{arg} should corresponds to format.") unless params[0].match?(instance_variable_get("@#{arg}"))
      when  :type
        raise TypeError.new("#{arg} should corresponds to type.") unless instance_variable_get("@#{arg}").class == params[0]
      end

        puts "Validation '#{validation_type}' compleated!"
    end

  end

  module InstanceMethods

    def validate!(arg, validation_type, *params)
      self.class.validate(arg, validation_type, *params)
    end

    def valid?(arg, validation_type, *params)
      !!validate!(arg, validation_type, *params)
    end

  end

end

class Smartphone
  include Validation

  @str = "hz"
  @string = "Sunny weather"
  @num = 123

  validate :str, :presence
  validate :string, :format, /\w+\s+\w+/
  validate :num, :type, Integer

  attr_accessor :name

  def initialize(name)
    @name = name
  end



end

# iphone = Smartphone.new("iphone 7")
# p iphone.name
# iphone.validate! :name, :presence
# iphone.validate! :name, :format, /\w+\s*\d+/
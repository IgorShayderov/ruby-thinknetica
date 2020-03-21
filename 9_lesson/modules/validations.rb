module Validations

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    attr_reader :validations

    def validate(attr, validation_type, *args)
      @validations ||= []
      validations << { attr: attr, validation_type: validation_type, args: args}
    end

  end

  module InstanceMethods

    def validate!
      self.class.instance_variable_get(:@validations).each do |validation|
        send "validate_#{validation[:validation_type]}".to_sym, validation[:attr], validation[:args][0]
      end
    end

    def validate_presence(attribute, arg="useless")
      raise TypeError.new("#{attribute} should not be empty.") unless !attribute.nil?
    end

    def validate_format(attribute, pattern)
      raise TypeError.new("You should pass Regexp into params.") unless pattern.class == Regexp
      raise TypeError.new("#{attribute} should corresponds to format.") unless pattern.match?attribute
    end

    def validate_type(attribute, type)
      attr_value = self.instance_variable_get("@#{attribute}")
      raise TypeError.new("#{attribute} should corresponds to type.") unless attr_value.class == type
    end

    def valid?
      !!validate!
    end

  end

end

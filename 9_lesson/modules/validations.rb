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

        case validation[:validation_type]
        when :presence
          raise TypeError.new("#{validation[:attr]} should not be empty.") unless !validation[:attr].nil?
        when :format
          raise TypeError.new("You should pass Regexp into params.") unless validation[:args][0].class == Regexp
          raise TypeError.new("#{validation[:attr]} should corresponds to format.") unless validation[:args][0].match?validation[:attr]
        when :type
          attr_value = instance_variable_get("@#{validation[:attr]}")
          raise TypeError.new("#{validation[:attr]} should corresponds to type.") unless attr_value.class == validation[:args][0]
        end
      end
      puts "Validation compleated!"
    end

    def valid?
      !!validate!
    end

  end

end

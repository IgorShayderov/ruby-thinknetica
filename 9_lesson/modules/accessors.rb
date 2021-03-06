module Accessors
  def attr_accessor_with_history(*methods)
    methods.each do |method|
      raise TypeError.new("#{method} is not symbol") unless method.is_a?(Symbol)
      define_method(method) do
        instance_variable_get("@#{method}")
      end
      define_method("#{method}=") do |value|
        instance_variable_set("@#{method}", value)

        instance_variable_get("@#{method}_history") ?
        instance_variable_get("@#{method}_history").push(value) :
        instance_variable_set("@#{method}_history", []).push(value)
      end

      define_method("#{method}_history") do
        instance_variable_get("@#{method}_history")
      end
    end
  end

  def strong_attr_accessor(*methods)
    options = methods.last.is_a?(Hash) ? methods.pop : {}
    methods.each do |method|
      raise TypeError.new("#{method} is not symbol") unless method.is_a?(Symbol)
      define_method(method) do
        instance_variable_get("@#{method}")
      end
      define_method("#{method}=") do |value|
        raise TypeError.new("#{value} is not a #{options[:class]}") unless value.class == options[:class]
        instance_variable_set("@#{method}", value)
      end
    end
  end

end

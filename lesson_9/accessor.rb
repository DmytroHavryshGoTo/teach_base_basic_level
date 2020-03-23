# frozen_string_literal: true

# Custom accessor module with history
module Accessor
  def self.included(base)
    base.extend ClassMethods
  end

  # Defining class methods
  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        history_name = "@#{name}_history".to_sym

        # Getter for value
        define_method(name) { instance_variable_get(var_name) }

        # Getter for value history
        define_method("#{name}_history".to_sym) do
          instance_variable_get(history_name) ||
            instance_variable_set(history_name, [])
        end

        # Setter for value
        define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          send("#{name}_history".to_sym) << value
        end
      end
    end

    def strong_attr_accessor(name, klass)
      var_name = "@#{name}".to_sym
      define_method(name) do
        instance_variable_get(var_name)
      end

      define_method("#{name}=".to_sym) do |value|
        raise "type of #{name} is not a #{klass}" unless value.is_a? klass

        instance_variable_set(var_name, value)
      end
    end
  end
end

# Just a test class
class Test
  include Accessor

  attr_accessor_with_history :volume, :marks
  strong_attr_accessor :name, String
end

test = Test.new
test.volume = 12
test.volume = 36
test.name = 'Dima'
puts test.name
puts test.volume
print test.volume_history

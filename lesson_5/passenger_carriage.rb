# frozen_string_literal: true

require_relative 'carriage'

# Derived Carriage class
class PassengerCarriage < Carriage
  def type
    :passenger
  end
end

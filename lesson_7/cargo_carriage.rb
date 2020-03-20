# frozen_string_literal: true

require_relative 'carriage'

# Derived Carriage class
class CargoCarriage < Carriage
  def type
    :cargo
  end
end

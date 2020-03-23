# frozen_string_literal: true

require_relative 'carriage'

# Derived Carriage class
class CargoCarriage < Carriage
  alias free_volume free_places
  alias taken_volume taken_places
  alias increase_taken_volume take_place

  def type
    :cargo
  end
end

# frozen_string_literal: true

require_relative 'train'

# Derived Train class
class CargoTrain < Train
  def type
    :cargo
  end
end

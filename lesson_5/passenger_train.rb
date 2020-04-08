# frozen_string_literal: true

require_relative 'train'

# Derived Train class
class PassengerTrain < Train
  def type
    :passenger
  end
end

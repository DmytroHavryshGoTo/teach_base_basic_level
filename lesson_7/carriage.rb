# frozen_string_literal: true

require_relative 'factory.rb'
require_relative 'instance_counter.rb'

# Parent Carriage class
class Carriage
  include Factory
  attr_reader :number

  def initialize(places)
    @number = rand(100)
    @places_quantity = places
    @taken_places = 0
    valid!
  end

  def type; end

  def free_places
    @places_quantity - @taken_places
  end

  def taken_places
    @taken_places
  end

  def take_place
    @taken_places += 1
  end

  def valid?
    valid!
  rescue StandardError
    false
  end

  protected

  def valid!
    raise 'Volume must be a positive number!' if @places_quantity.negative?

    true
  end
end

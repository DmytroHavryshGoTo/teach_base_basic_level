# frozen_string_literal: true

require_relative 'factory.rb'

# Parent Carriage class
class Carriage
  include Factory
  def type; end
end

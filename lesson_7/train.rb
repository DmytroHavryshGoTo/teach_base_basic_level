# frozen_string_literal: true

require_relative 'factory.rb'
require_relative 'instance_counter.rb'

# Parent Train class
class Train
  include Factory
  include InstanceCounter
  attr_reader :number, :current_station
  attr_accessor :speed
  @@all_trains = []

  NUMBER_PATTERN = /^[0-9a-zA-Z]{3}-?[0-9a-zA-Z]{2}$/.freeze

  def initialize(number)
    @number = number
    @carriages = []
    @speed = 0
    valid!
    @@all_trains << self
    register_instance
  end

  def valid?
    valid?
  rescue StandardError
    false
  end

  def self.find(train_number)
    @@all_trains.select { |train| train.number == train_number }
  end

  def route=(new_route)
    @route = new_route.station_list
    @current_station = @route[0]
  end

  def type; end

  def carriages
    @carriages.length
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)
    return unless @speed.zero?

    @carriages << carriage if carriage.type == @type
  end

  def remove_carriage
    @carriages.pop if @speed.zero? && carriages.positive?
  end

  def move(station_name)
    @current_station = station_name if @route.include? station_name
  end

  def next_station
    puts @route[current_station_index + 1] unless current_station_index.nil?
  end

  def prev_station
    puts @route[current_station_index - 1] unless current_station_index.nil?
  end

  protected

  def valid!
    raise 'Number is required!' if @number.nil?
    raise 'Speed can not be negative!' if @speed.negative?
    raise 'Enter right number format!' if @number !~ NUMBER_PATTERN

    true
  end

  def current_station_index
    @route.rindex(@current_station)
  end
end

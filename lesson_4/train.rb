# frozen_string_literal: true

# Parent Train class
class Train
  attr_reader :number, :current_station
  attr_accessor :speed

  def initialize(number)
    @number = number
    @carriages = []
    @speed = 0
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

  def current_station_index
    @route.rindex(@current_station)
  end
end

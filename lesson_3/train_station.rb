# frozen_string_literal: true

# Create class Station that has name, can display list of trains
# which are on station at the moment, can display trains by type,
# can send trains away from station.
#
# Create class Train that has number, type, quantity of railway
# carriage, can pick up the speed and slow down, display speed,
# display quantity of quantity of railway carriages, add and remove
# carriages, can move between stations(which are mentioned in route),
# display previous, current and next station according to route
#
# Create class Route that has first and last station and list of temp
# stations, can add and remove temp stations, display list of stations
# in order from first to last

# Station class
class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @list_of_trains = []
  end

  def add_train(train)
    @list_of_trains << train
  end

  def display_all_trains
    @list_of_trains.each do |train|
      puts "Number - #{train.number}, type - #{train.type}"
    end
  end

  def display_trains_by_type
    list_by_types = {}
    @list_of_trains.each do |train|
      if list_by_types[train.type].nil?
        list_by_types[train.type] = 1
      else
        list_by_types[train.type] += 1
      end
    end
    list_by_types.each { |type, volume| puts "#{type} - #{volume}" }
  end

  def remove_train
    @list_of_trains.pop
  end
end

# Train class
class Train
  attr_reader :type, :carriages, :number, :current_station
  attr_accessor :speed

  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
  end

  def route=(new_route)
    @route = new_route.station_list
    @current_station = @route[0]
  end

  def stop
    @speed = 0
  end

  def add_carriage
    @carriages += 1 if @speed.zero?
  end

  def remove_carriage
    @carriages -= 1 if @speed.zero? && @carriages.positive?
  end

  def move(station_name)
    @current_station = station_name if @route.include? station_name
  end

  def next_station
    current_index = @route.rindex(@current_station)
    puts @route[current_index + 1] unless current_index.nil?
  end

  def prev_station
    current_index = @route.rindex(@current_station)
    puts @route[current_index - 1] unless current_index.nil?
  end
end

# Route class
class Route
  def initialize(start_station, end_station)
    @station_list = [start_station, end_station]
  end

  def station_list
    @station_list.map(&:name)
  end

  def add_station(station)
    @station_list.insert(-2, station)
  end

  def remove_station(station)
    @station_list.delete(station) unless
      @station_list[0] == station && @station_list[-1] == station
  end
end

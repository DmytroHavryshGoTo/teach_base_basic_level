# frozen_string_literal: true

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

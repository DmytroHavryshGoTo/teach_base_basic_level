class TrainStation < ApplicationRecord
  has_many :trains
  has_many :train_stations_routes
  has_many :routes, through: :train_stations_routes
  validates :title, presence: true

  scope :ordered, -> { select('train_stations.*, train_stations_routes.number').joins(:train_stations_routes).order("train_stations_routes.number").uniq }
  
  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(number: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:number)
  end

  def update_time(route, departure_time, arrival_time)
    station_route = station_route(route)
    station_route.update(departure_time: departure_time, arrival_time: arrival_time) if station_route
  end

  def departure_time_in(route)
    station_route(route).try(:departure_time)
  end

  def arrival_time_in(route)
    station_route(route).try(:arrival_time)
  end

  private

  def station_route(route)
    @station_route = train_stations_routes.where(route: route).first
  end
end

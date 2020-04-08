class Route < ApplicationRecord
  validates :name, presence: true

  has_many :train_stations_routes
  has_many :train_stations, through: :train_stations_routes
  has_many :trains

  def self.find_route(from, to)
    routes = []
    if (from && to)
      station_from = TrainStation.find(from)
      station_to = TrainStation.find(to)
      Route.all.each do |route|
        if route.train_stations.include?(station_from) &&
            route.train_stations.include?(station_to) &&
            station_from.position_in(route) < station_to.position_in(route)
          routes.push({ route: Route.find(route.id), departure_station: station_from, arrival_station: station_to })
        end
      end
    end
    routes
  end
end

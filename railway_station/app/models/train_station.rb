class TrainStation < ApplicationRecord
  has_many :trains
  has_many :train_stations_routes
  has_many :routes, through: :train_stations_routes
end

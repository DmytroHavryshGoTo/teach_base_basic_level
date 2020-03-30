class Route < ApplicationRecord
  validates :name, presence: true

  has_many :train_stations_routes
  has_many :train_stations, through: :train_stations_routes
  has_many :trains
end

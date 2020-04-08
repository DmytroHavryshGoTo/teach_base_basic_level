class SeatedCarriage < Carriage
  validates :seat_places, presence: true
end
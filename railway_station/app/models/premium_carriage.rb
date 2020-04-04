class PremiumCarriage < Carriage
  validates :bottom_places, presence: true
end
class CoupeCarriage < Carriage
  validates :top_places, :bottom_places, presence: true
end
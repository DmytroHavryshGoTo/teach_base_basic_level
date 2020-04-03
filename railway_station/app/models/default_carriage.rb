class DefaultCarriage < Carriage
  validates :bottom_places, :top_places, :side_bottom_places, :side_top_places, presence: true
end
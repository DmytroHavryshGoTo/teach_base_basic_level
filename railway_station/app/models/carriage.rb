class Carriage < ApplicationRecord
  validates :carriage_type, presence: true
  validates :top_places, presence: true
  validates :bottom_places, presence: true

  belongs_to :train
end
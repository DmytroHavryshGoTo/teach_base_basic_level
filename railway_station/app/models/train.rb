class Train < ApplicationRecord
  validates :number, :sort, presence: true

  belongs_to :current_station, class_name: 'TrainStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages, ->(train) { order(train.sort? ? :number : 'number DESC') }

  def count_places(carriage_type, place_type)
    carriages.where(type: carriage_type).sum(place_type)
  end
end

class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :base_station, class_name: 'TrainStation', foreign_key: :base_station_id
  belongs_to :end_station, class_name: 'TrainStation', foreign_key: :end_station_id
  validates :first_name, :last_name, :passport_number, presence: true
  validate :same_stations?

  private

  def same_stations?
    errors.add(:base_station, 'and End station cant be same') if base_station == end_station
  end
end

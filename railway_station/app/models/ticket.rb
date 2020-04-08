class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :base_station, class_name: 'TrainStation', foreign_key: :base_station_id
  belongs_to :end_station, class_name: 'TrainStation', foreign_key: :end_station_id
end

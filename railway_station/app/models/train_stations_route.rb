class TrainStationsRoute < ApplicationRecord
  belongs_to :train_station
  belongs_to :route
end

class AddTrainStationIdToTrains < ActiveRecord::Migration[6.0]
  def change
    #add_column :trains, :train_station_id, :integer
    add_belongs_to :trains, :current_station

  end
end

class CreateStationsRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :train_stations_routes do |t|
      t.belongs_to :train_station, index: true
      t.belongs_to :route, index: true
    end
  end
end

class CreateCarriages < ActiveRecord::Migration[6.0]
  def change
    create_table :carriages do |t|
      t.string :type
      t.integer :top_places
      t.integer :bottom_places
      t.integer :side_bottom_places
      t.integer :side_top_places
      t.integer :seat_places
      t.belongs_to :train
      t.integer :number

      t.timestamps
    end

    add_column :trains, :sort, :boolean
    add_column :train_stations_routes, :number, :integer
  end
end

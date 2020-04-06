class AddArrivalAndDepatureTime < ActiveRecord::Migration[6.0]
  def change
    add_column :train_stations_routes, :departure_time, :string
    add_column :train_stations_routes, :arrival_time, :string
    add_column :tickets, :first_name, :string
    add_column :tickets, :last_name, :string
    add_column :tickets, :passport_number, :string
  end
end

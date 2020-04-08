class AddBaseAndEndStationsToTicket < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :tickets, :base_station
    add_belongs_to :tickets, :end_station
  end
end

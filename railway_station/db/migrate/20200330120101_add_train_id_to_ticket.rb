class AddTrainIdToTicket < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :tickets, :train
  end
end

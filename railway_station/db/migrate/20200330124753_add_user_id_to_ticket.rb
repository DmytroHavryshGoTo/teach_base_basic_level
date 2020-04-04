class AddUserIdToTicket < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :tickets, :user
  end
end

class ChangeCarriageOrder < ActiveRecord::Migration[6.0]
  def change
    change_column :trains, :sort, :integer
  end
end

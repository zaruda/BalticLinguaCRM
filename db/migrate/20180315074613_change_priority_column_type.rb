class ChangePriorityColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :priority, :string
  end
end

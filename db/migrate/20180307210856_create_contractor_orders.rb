class CreateContractorOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :contractor_orders do |t|
      t.references :order, foreign_key: true
      t.references :contractor, foreign_key: true

      t.timestamps
    end
  end
end

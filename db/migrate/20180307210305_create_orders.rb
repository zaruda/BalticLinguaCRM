class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status
      t.string :payment_status
      t.datetime :start_date_contractor
      t.datetime :end_date_contractor
      t.datetime :start_date_customer
      t.datetime :end_date_customer
      t.integer :priority
      t.text :description
      t.string :scope_of_work
      t.string :price
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end

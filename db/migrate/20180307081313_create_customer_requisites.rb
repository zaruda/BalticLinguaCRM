class CreateCustomerRequisites < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_requisites do |t|
      t.string :value
      t.references :customer, foreign_key: true
      t.references :requisite, foreign_key: true

      t.timestamps
    end
  end
end

class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :unp_ogrn
      t.string :scope
      t.string :category
      t.string :type
      t.string :status
      t.text :comment
      t.string :bill_type
      t.boolean :is_bill_attachment
      t.string :application_type
      t.string :invoice_from
      t.string :payment_type

      t.timestamps
    end
  end
end

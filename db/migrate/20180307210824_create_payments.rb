class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :amount
      t.string :status
      t.references :order, foreign_key: true
      t.references :contractor, foreign_key: true

      t.timestamps
    end
  end
end

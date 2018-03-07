class CreateContractors < ActiveRecord::Migration[5.2]
  def change
    create_table :contractors do |t|
      t.string :name
      t.string :department
      t.date :birthday
      t.string :invoices_from
      t.string :status

      t.timestamps
    end
  end
end

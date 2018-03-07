class CreateCustomerContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_contacts do |t|
      t.string :region
      t.string :address
      t.string :phone
      t.string :fax
      t.string :email
      t.string :website
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end

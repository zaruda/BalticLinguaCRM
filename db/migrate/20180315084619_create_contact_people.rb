class CreateContactPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_people do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end

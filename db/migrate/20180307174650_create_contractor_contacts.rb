class CreateContractorContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contractor_contacts do |t|
      t.string :phone
      t.string :email
      t.references :contractor, foreign_key: true

      t.timestamps
    end
  end
end

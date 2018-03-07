class CreateContractorServices < ActiveRecord::Migration[5.2]
  def change
    create_table :contractor_services do |t|
      t.string :language_from
      t.string :language_to
      t.references :contractor, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end

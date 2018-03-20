class CreateContractorRequisites < ActiveRecord::Migration[5.2]
  def change
    create_table :contractor_requisites do |t|
      t.string :value
      t.references :contractor, foreign_key: true
      t.references :requisite, foreign_key: true

      t.timestamps
    end
  end
end

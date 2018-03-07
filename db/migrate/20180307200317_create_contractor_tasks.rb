class CreateContractorTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :contractor_tasks do |t|
      t.string :status
      t.string :tarif
      t.string :scope_of_work
      t.text :description
      t.references :contractor, foreign_key: true

      t.timestamps
    end
  end
end

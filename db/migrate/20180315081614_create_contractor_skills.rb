class CreateContractorSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :contractor_skills do |t|
      t.references :contractor, foreign_key: true
      t.references :programm, foreign_key: true

      t.timestamps
    end
  end
end

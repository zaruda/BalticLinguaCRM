class CreateProgramms < ActiveRecord::Migration[5.2]
  def change
    create_table :programms do |t|
      t.string :name

      t.timestamps
    end
  end
end

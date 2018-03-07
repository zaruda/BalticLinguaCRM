class CreateEditorTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :editor_tasks do |t|
      t.string :status
      t.string :tarif
      t.text :description
      t.references :admin_user, foreign_key: true

      t.timestamps
    end
  end
end

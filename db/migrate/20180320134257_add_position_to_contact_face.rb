class AddPositionToContactFace < ActiveRecord::Migration[5.2]
  def change
    add_column :contact_people, :position, :string
    add_column :contact_people, :description, :text
  end
end

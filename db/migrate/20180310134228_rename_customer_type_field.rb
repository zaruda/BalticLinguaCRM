class RenameCustomerTypeField < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :type, :kind
  end
end

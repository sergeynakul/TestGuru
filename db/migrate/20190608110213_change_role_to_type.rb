class ChangeRoleToType < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :role, :type
    change_column_null :users, :type, false, 'User'
    add_index :users, :type
  end
end

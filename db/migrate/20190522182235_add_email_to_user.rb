class AddEmailToUser < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :email, :string
    change_column_null :users, :email, false
  end

  def down
    remove_column :users, :email, :string
  end
end

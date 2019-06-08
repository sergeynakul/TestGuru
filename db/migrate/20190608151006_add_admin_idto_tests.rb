class AddAdminIdtoTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :admin_id, :integer, null: false, default: 1
  end
end

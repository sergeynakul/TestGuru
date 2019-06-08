class ChangeAdminIdDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:tests, :admin_id, from: 1, to: nil)
  end
end

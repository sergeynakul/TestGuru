class AddTestsTileNullConstraint < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:tests, :title, false)
  end
end

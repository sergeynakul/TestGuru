class AddCategoriesTitleNullConstraint < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:categories, :title, false)
  end
end

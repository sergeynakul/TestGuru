class AddAuthordIdToTests < ActiveRecord::Migration[5.0]
  def change
    add_column :tests, :author_id, :integer
  end
end

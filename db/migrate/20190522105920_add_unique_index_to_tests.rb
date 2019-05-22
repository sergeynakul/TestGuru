class AddUniqueIndexToTests < ActiveRecord::Migration[5.0]
  def change
    add_index :tests, %i[title level], unique: true
  end
end

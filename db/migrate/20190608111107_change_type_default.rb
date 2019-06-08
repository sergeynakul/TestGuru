class ChangeTypeDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :type, from: nil, to: 'User'
  end
end

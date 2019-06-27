class RemoveColumnsFromBadges < ActiveRecord::Migration[5.2]
  def change
    remove_column :badges, :rule_value, :string
    remove_column :badges, :rule_name, :string
  end
end

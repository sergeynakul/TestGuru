class AddTimeEndToPassedTests < ActiveRecord::Migration[5.2]
  def change
    add_column :passed_tests, :time_end, :datetime
  end
end

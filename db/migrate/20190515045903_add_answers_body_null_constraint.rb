class AddAnswersBodyNullConstraint < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:answers, :body, false)
  end
end

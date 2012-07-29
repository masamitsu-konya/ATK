class AddColumnDeletedAtToCategoryOfQuestion < ActiveRecord::Migration
  def change
    add_column :category_of_questions, :deleted_at, :datetime
  end
end

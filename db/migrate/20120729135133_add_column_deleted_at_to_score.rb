class AddColumnDeletedAtToScore < ActiveRecord::Migration
  def change
    add_column :scores, :deleted_at, :datetime
  end
end

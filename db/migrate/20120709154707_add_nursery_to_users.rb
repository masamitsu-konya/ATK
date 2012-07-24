class AddNurseryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nursery, :integer
  end
end

class CreateUserFriends < ActiveRecord::Migration
  def change
    create_table :user_friends do |t|
      t.integer :user_id
      t.integer :friend_id
      t.integer :friend_uid, :limit => 8
      t.timestamps
    end
  end
end

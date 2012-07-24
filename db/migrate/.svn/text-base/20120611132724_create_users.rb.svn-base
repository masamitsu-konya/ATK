class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :location
      t.string :company
      t.string :nickname
      t.string :email
      t.binary :image_url, :limit => 10.megabytes
      t.integer :uid ,:limit => 8
      t.string :access_token
      t.string :provider
      t.timestamps
    end
  end
end

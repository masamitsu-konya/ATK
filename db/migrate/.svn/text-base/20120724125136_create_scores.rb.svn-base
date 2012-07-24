class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :user
      t.float :rd
      t.float :score
      t.references :category_of_question

      t.timestamps
    end
    add_index :scores, :user_id
    add_index :scores, :category_of_question_id
  end
end

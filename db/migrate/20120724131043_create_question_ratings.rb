class CreateQuestionRatings < ActiveRecord::Migration
  def change
    create_table :question_ratings do |t|
      t.references :question
      t.float :rating
      t.float :rd

      t.timestamps
    end
    add_index :question_ratings, :question_id
  end
end

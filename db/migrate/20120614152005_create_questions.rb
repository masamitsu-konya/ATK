class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :category_of_question_id
      t.string :question
      t.string :correct_answer
      t.string :answer_1
      t.string :answer_2
      t.string :answer_3
      t.timestamps
    end
  end
end

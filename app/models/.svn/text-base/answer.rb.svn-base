class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  attr_accessible :correct


    def self.create_data(user_id, question_id, result)
      @answers = Answer.new
      @answers.user_id = user_id
      @answers.question_id = question_id
      @answers.correct = result
      @answers.save
    end
end

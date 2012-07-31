class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  attr_accessible :correct

  class << self
    def create_record(user_id, question_id, result)
      @answer = self.new
      @answer.user_id = user_id
      @answer.question_id = question_id
      @answer.correct = result
      @answer.save
    end
  end
end

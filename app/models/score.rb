class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :category_of_question
  attr_accessible :rd, :score

  validates :user_id, :uniqueness=>{:scope => :category_of_question_id}, :presence => true
  validates :category_of_question_id, :presence=>true
  validates :score, :presence=>true

  scope :beginner, where('score<=300')
  scope :familiar, where('score>? and score<=?',300,449)
  scope :proficient, where('score>? and score<=?',449,699)
  scope :expert, where('score>? and score<=?',669,779)
  scope :master, where('score>? and score<=?',779,800)

  class << self
    def calculate_score(user_id, question_id, result, time)
      if result=="true"
        question_count = (Answer.where(:question_id => question_id).count)*1.0
        correct_count = (Answer.where(:question_id => question_id, :correct => true).count)*1.0
        percentage_of_correct_answers = 1/(correct_count/question_count)
        score = (percentage_of_correct_answers*time.to_i).round
      else
        score = 0
      end
      return score
    end

    def regist_user_score(user_id, category_id, sum_score)
      if Score.where(:user_id => user_id, :category_of_question_id => category_id) 
        @user_score = Score.where(:user_id => user_id, :category_of_question_id => category_id).last
        @user_score.attributes={:score => sum_score}
      else
        @user_score = Score.new
        @user_score.user_id = user_id
        @user_score.category_of_question_id = category_id
        @user_score.score = sum_score
      end
      @user_score.save
    end
  end
end

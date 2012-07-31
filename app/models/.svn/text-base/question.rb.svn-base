class Question < ActiveRecord::Base
   attr_accessible :category_of_question_id, :question, :correct_answer, :answer_1, :answer_2, :answer_3, :user_question_attributes, :rank, :question_rating_attributes
   acts_as_paranoid
   has_one :user_question
   has_one :question_rating
   belongs_to :user
   belongs_to :category_of_question

   accepts_nested_attributes_for :user_question, :question_rating

   validates :category_of_question_id, :presence => true
   validates :question, :presence => true, :uniqueness => true
   validates :correct_answer, :presence => true
   validates :answer_1, :presence => true

   scope :public, where(:public => true)

   VERY_HARD=5
   HARD=4
   MODERATE=3
   EASY=2
   VERY_EASY=1

   class << self
    def question_choice(category_id, question_id, result)
     question_rank = Question.where(:id => question_id).first.rank
     if result=="true"
       case question_rank
         when Question::VERY_EASY
           @test = Question.where(:rank => Question::EASY).sort_by{rand}.first
         when Question::EASY
           @test = Question.where(:rank => Question::MODERATE).sort_by{rand}.first
         when Question::MODERATE
           @test = Question.where(:rank => Question::HARD).sort_by{rand}.first
         else
           @test = Question.where(:rank => Question::VERY_HARD).sort_by{rand}.first
       end
     else
       case question_rank
         when Question::VERY_EASY || Question::EASY
           @test = Question.where(:rank => Question::VERY_EASY).sort_by{rand}.first
         when Question::MODERATE
           @test = Question.where(:rank => Question::EASY).sort_by{rand}.first
         when Question::HARD
           @test = Question.where(:rank => Question::MODERATE).sort_by{rand}.first
         else
           @test = Question.where(:rank => Question::HARD).sort_by{rand}.first
       end
     end
     return @test
   end

   def update_rank(question_id)
     question = Question.where(:id => question_id).first
     question_count = (Answer.where(:question_id => question_id).count)*1.0
     correct_count = (Answer.where(:question_id => question_id, :correct => true).count)*1.0
     percentage_of_correct_answers = ((correct_count/question_count)*100).round
     case percentage_of_correct_answers
     when 0..10 then question.rank = Question::VERY_HARD
     when 11..20 then question.rank = Question::HARD
     when 21..50 then question.rank = Question::MODERATE
     when 51..70 then question.rank = Question::EASY
     else question.rank = Question::VERY_EASY
     end
     question.save!
   end
  end

  # 問題を出す順番を決定
  def next_choice(score, question_ratings)
    next_question_id = question_ratings.where("rating > ?", score.score).shuffle.first.question.id
    self.find(next_question_id)
  end

  # 問題のランクを決定
  def get_rank
    point = self.question_rating.nil? ? QuestionRating.find_by_question_id(self.id).rating : self.question_rating.rating
    if point <= 1350.0
      self.rank = 1
    elsif point > 1350.0 && point <= 1450.0
      self.rank = 2
    elsif point > 1450.0 && point <= 1550.0
      self.rank = 3
    elsif point > 1550.0 && point <= 1650.0
      self.rank = 4
    elsif point > 1650.0
      self.rank = 5
    else
    end
  end

end

class Ranking < ActiveRecord::Base
  attr_accessible :category_of_question_id, :user_id, :rank

  validates :user_id, :presence => true
  validates :category_of_question_id, :presence => true
  validates :rank, :presence => true

  belongs_to :user
  belongs_to :category_of_questions

  class << self
    def create_ranking(category_id)
      category_of_question = CategoryOfQuestion.find(category_id)
        #過去のランキング削除
        old_ranking = Ranking.where(:category_of_question_id => category_id)
        old_ranking.each{|rank| rank.delete}
        #新しいランキング作成
        user_scores = Score.where(:category_of_question_id => category_id).order('score DESC')[0..20]
        rank = 0
        user_scores.each do |user_score|
          rank +=1
          @ranking = Ranking.new(:category_of_question_id => category_id, :user_id => user_score.user_id, :rank=> rank)    
          @ranking.save
        end
    end
  end
end

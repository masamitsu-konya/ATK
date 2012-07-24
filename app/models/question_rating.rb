class QuestionRating < ActiveRecord::Base
  belongs_to :question
  attr_accessible :rating, :rd
end

class UserQuestion < ActiveRecord::Base
  attr_accessible :user_id, :question_id
  validates :user_id, :presence => true
  validates :question_id, :presence => true

  belongs_to :question
  belongs_to :user
end

class UserQuestion < ActiveRecord::Base
  attr_accessible :user_id, :question_id
  act_as_paranoid

  belongs_to :question
  belongs_to :user
end

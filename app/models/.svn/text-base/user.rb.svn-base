class User < ActiveRecord::Base
  acts_as_paranoid
  attr_accessible :email, :image_url, :nickname

  has_many :user_questions
  has_many :scores
  has_many :questions, :through => :user_questions
  has_many :user_friends
  has_many :rankings

  MORIYAMA = 100001901781582
  AONO = 100002224998994
  KONYA = 100000222194320
  
  def self.create_account(auth)
    p auth
    user = User.new
    user.nickname = auth['info']['nickname']
    if user.provider = auth['provider'] == "facebook"  
      user.last_name = auth['info']['last_name']
      user.first_name = auth['info']['first_name']
      user.company = auth['extra']['raw_info']['work'][0]['employer']['name'] if auth['extra']['raw_info']['work']
      user.location = auth['info']['location'] if auth['info']['location']
      user.email = auth['info']['email'] if auth['info']['email']
      user.access_token = auth['credentials']['token'] 
      user.uid = auth['uid']
    end
    user.image_url = auth['info']['image']
    user.provider = auth['provider']
    user.save!
    UserFriend.create_user_friends(user)
    return user
  end

end

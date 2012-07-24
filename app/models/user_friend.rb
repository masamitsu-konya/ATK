require 'open-uri'
require 'json/pure'
class UserFriend < ActiveRecord::Base
   attr_accessible :user_id, :friend_uid, :friend_id
   
   validates :friend_uid, :uniqueness => {:scope =>:user_id}
   validates :friend_id, :uniqueness => {:scope => :user_id}, :presence => true
   validates :user_id ,:presence => true
   
   belongs_to :user

class << self 
      
   def create_user_friends(user)
    if user.provider == 'facebook' 
      @friends = JSON.parse URI("https://graph.facebook.com/me/friends?access_token=#{user.access_token}").read
      @friends['data'].each do |friend|
        if User.where(:uid => friend['id']).present?
          friend_id = User.where(:uid => friend['id']).first.id
          if  UserFriend.where(:user_id => user.id, :friend_id => friend_id, :friend_uid => friend['id'].to_i).blank?
            user_friend = UserFriend.new(:user_id => user.id, :friend_id => friend_id, :friend_uid => friend['id'].to_i)
            user_friend.save
          end
        end
      end
    end
   end
end
end

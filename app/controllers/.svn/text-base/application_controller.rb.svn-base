class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :user_defined, :user_friends
 
  def user_defined
    session[:user_id] ? @user=User.find(session[:user_id]) : @user=nil
  end

  def user_friends
    @user ? @user_friends = @user.user_friends : @user_friends=nil
  end 
end

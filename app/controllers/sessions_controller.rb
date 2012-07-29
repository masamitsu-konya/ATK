# coding: utf-8
class SessionsController < ApplicationController


  def login_request
    
  end

  def login
    auth = request.env['omniauth.auth']
    p request.env['omniauth.auth']
    user = User.find_by_uid(auth['uid']) || User.create_account(auth)
   
    session[:user_id] = user.id
    #logger.debug auth.to_yaml
    # 毎回更新 友達情報
    UserFriend.create_user_friends(@user)
    redirect_to root_url, :notice => 'ログインしました。'
  end
   
  def logout
    session[:user_id] = nil
    redirect_to root_url, :notice => 'ログアウトしました。'
  end

end

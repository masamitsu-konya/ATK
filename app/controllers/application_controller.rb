class ApplicationController < ActionController::Base
  protect_from_forgery

  def login_check
    if session[:user_id].blank?
      redirect_to :controller => "sessions", :action => "login_request"      
    end
  end
end

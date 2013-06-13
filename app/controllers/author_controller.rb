# coding: utf-8
class AuthorController < ApplicationController
  before_filter :login_check
  
  def index 
    @questions = User.find(session[:user_id]).questions.where(:category_of_question_id => params[:id]).order('id ASC')
    @category_name = CategoryOfQuestion.find(params[:id])
  end  
end

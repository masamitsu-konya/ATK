# coding: utf-8
class WelcomeController < ApplicationController
 before_filter :login_check

  def index
    if session[:user_id].blank?
      redirect_to :action=> "login"
    else
      @user = User.find(session[:user_id])  
      @user_questions_categories = @user.questions.map(&:category_of_question).uniq
      @user_questions = @user.questions
      @user_beginner_skills = @user.scores.beginner
      @user_familiar_skills = @user.scores.familiar
      @user_proficient_skills = @user.scores.proficient
      @user_expert_skills = @user.scores.expert
      @user_master_skills = @user.scores.master
    end
    @recommend_categories = CategoryOfQuestion.all
  end

  def profile
    @user = User.find(params[:id])
  end
  
end

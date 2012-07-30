# coding: utf-8
# coding: utf-8
class AdminController < ApplicationController  
  before_filter :login_check
  
  def index
    @unpublic_questions = Question.where(:public => false)
  end

  def edit_question
    @question = Question.find(params[:id])
    @category_of_question = @question.category_of_question
  end

  def finish
    @question = Question.find(params[:id])
    @question.attributes = params[:question]
    @question.save
    redirect_to :action => :index
  end

  def finish_category
    @category = CategoryOfQuestion.find(params[:id])
    @category.attributes = params[:category_of_question]
    @category.save
    redirect_to :action => :category
  end

  def category
    @categories = CategoryOfQuestion.all
  end

  def edit_category
    @category = CategoryOfQuestion.find(params[:id])
  end

#ajax
  def accept_public
    @question = Question.find(params[:id])
    @question.public = true
    @question.save 
    render :json => {:id => params[:id]}
  end
end

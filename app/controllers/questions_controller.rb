# coding: utf-8
class QuestionsController < ApplicationController
  before_filter :login_check  
  def new
    @category_of_question = CategoryOfQuestion.new
  end
  
  def create
    @question = Question.new
    if CategoryOfQuestion.where(:category_name => params[:category_of_question][:category_name]).blank?
      @category_of_question = CategoryOfQuestion.new(params[:category_of_question])
      @category_of_question.save
    else
      @category_of_question = CategoryOfQuestion.where(:category_name => params[:category_of_question][:category_name]).first
    end
  end

  def finish 
    @question = Question.new(params[:question])
    @question.update_attributes(params[:question])
    @question.save
    @category_id = @question.category_of_question_id
  end

  def upload
    @picture = PictureOfCategory.new(params[:picture_of_category])
    @picture.save
    redirect_to :action => 'new'
  end

end

# coding: utf-8
class QuestionsController < ApplicationController
  before_filter :login_check  
  def new
    @category_of_question = CategoryOfQuestion.new
  end
  
  def create
    @question = Question.new
    if CategoryOfQuestion.where('category_name like ? ',"%" +params[:category_of_question][:category_name]+ "%" ).blank?
      @category_of_question = CategoryOfQuestion.new(params[:category_of_question])
      @category_of_question.save
    else
      @category_of_question = CategoryOfQuestion.where('category_name like ? ',"%" +params[:category_of_question][:category_name]+ "%" ).first
    end
  end

#ajax
  def finish_create 
    if Question.where(:question => params[:question]).present?
      render :json =>{:result => 'false'}
    else
      begin
        @question = Question.new(:question => params[:question], :category_of_question_id => params[:category_of_question] ,:correct_answer => params[:question_correct_answer], :answer_1 => params[:question_answer_1],
                               :answer_2 => params[:question_answer_2], :answer_3 => params[:question_answer_3])
        @question.save
        @user_question = UserQuestion.new(:user_id => params[:user_id], :question_id => @question.id)
        @user_question.save
        @question_rating = QuestionRating.new(:question_id => @question.id, :rating => params[:rating], :rd => params[:rd])
        @question_rating.save
        render :json =>{:result => 'ok'}
      rescue
        render :json =>{:result => 'false'}
      end
    end
  end

  def upload
    @picture = PictureOfCategory.new(params[:picture_of_category])
    @picture.save
    redirect_to :action => 'new'
  end

end

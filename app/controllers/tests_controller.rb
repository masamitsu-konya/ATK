#coding: utf-8
class TestsController < ApplicationController
  before_filter :login_check
  def index
    @categories = CategoryOfQuestion.all
  end

  def search_test
    if params[:search_words] && CategoryOfQuestion.where('category_name like ? ',"%" +params[:search_words]+ "%" ).present?
      @title_of_test = CategoryOfQuestion.where('category_name like ? ',"%" +params[:search_words]+ "%" ).first
      redirect_to :action => :take_test, :id => @title_of_test.id
    else
      redirect_to :action => 'index'
    end
  end

  def take_test
    @test_category = CategoryOfQuestion.find(params[:id])
    if Question.where("category_of_question_id = ?", @test_category.id).except_experience(@user.id).blank?
      @result = false
    end
  end

  # 練習問題
  def test_practice
    @questions = Question.where(:category_of_question_id => params[:id])
    @sample_question = @questions.first
    @question_count = -1
  end

  # 本番
  def test
    @score = @user.scores.find_by_category_of_question_id(params[:category_of_question_id].to_i)
    if @score.nil?
      @score = Score.new
      @score.score_initialize
      @score.user_id = session[:user_id]
      @score.category_of_question_id = params[:category_of_question_id].to_i
      @score.save
    else
      if params[:rd_user].present?
        @score.user_id = session[:user_id]
        @score.category_of_question_id = params[:category_of_question_id].to_i
        @score.rd = params[:rd_user].to_f
        @score.score = params[:score].to_f
      end
    end

    @rd_array_user = params[:rd_array_user]
    @g_array_user = params[:g_array_user]
    @e_array_user = params[:e_array_user]
    @d_array_user = params[:d_array_user]
    @result_array_user = params[:result_array_user]

    @question_count = params[:question_count] ? params[:question_count].to_i : 0
    @question_total_count = Question.where("category_of_question_id = ?", params[:category_of_question_id]).count - 1
    @question = Question.where("category_of_question_id = ?", params[:category_of_question_id]).except_experience(@user.id).first
    
    if @question.nil?
      redirect_to :controller => :welcome, :action => :index
    end

    if @question.present?
      if @question.question_rating.nil?
        @question_rating = QuestionRating.new(:question_id => @question.id, :rating => QuestionRating::INITIAL_RATING, :rd => QuestionRating::INITIAL_RD)
        @question_rating.save
      else
        @question_rating = @question.question_rating
      end
      @level = @question.get_rank_key
    end
  end


end

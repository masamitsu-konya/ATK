#coding: utf-8
class TestsController < ApplicationController
  before_filter :login_check
  def index
    @categories = CategoryOfQuestion.all
  end

  def search_test
    if params[:search_words] && CategoryOfQuestion.where(:category_name => params[:search_words])
      @title_of_test = CategoryOfQuestion.where(:category_name => params[:search_words]).first
      redirect_to :action => :take_test, :id => @title_of_test.id
    else
      redirect_to :controller => 'question', :action => 'index'
    end
  end

  def take_test
    @test_category = CategoryOfQuestion.find(params[:id])
  end

  def test_practice
    @test = Question.where(:category_of_question_id => params[:id]).first
    p "#{@test.id.class}"
    @count=0
  end

  def test
    params[:count] ? @count=params[:count].to_i : @count = 0
    params[:sum_count] ? @score=params[:sum_count].to_i : @score = 0
    @test = Question.question_choice(params[:category_of_question_id], params[:question_id], params[:question_result])
    @test_rank = Question.get_test_rank(@test.id)
  end


  #ajax
  def judge_answer
  #問題の結果保存
    Answer.create_data(params[:user_id].to_i,params[:question_id].to_i,params[:result])
  #得点の計算
    score = Score.calculate_score(params[:user_id].to_i, params[:question_id].to_i, params[:result], params[:time])
  #問題ランクの更新
    #Question.update_rank(params[:question_id].to_i)
    render :json => {:score => score.to_s}
  end

  def regist_user_score 
    score = Score.calculate_score(params[:user_id], params[:question_id], params[:result], params[:time])
    last_score = score.to_i + params[:sum_score].to_i
   #スコアを登録 
    Score.regist_user_score(params[:user_id].to_i, params[:category_id].to_i, last_score)
   #ランキングを更新
    Ranking.create_ranking(params[:category_id].to_i)
    render :json => {:score => score}
  end
end

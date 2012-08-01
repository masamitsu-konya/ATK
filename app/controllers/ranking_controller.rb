# coding: utf-8
class RankingController < ApplicationController
  def index
    if @user.scores.present? 
      @past_test_categories = @user.scores.map(&:category_of_question)
 #カテゴリーを選択した場合 
      if params[:id] 
        @ranking_category = CategoryOfQuestion.find(params[:id])
        @ranking = Ranking.where(:category_of_question_id => @ranking_category.id)
      else 
        @ranking_category = @user.scores.order('updated_at ASC').map(&:category_of_question).last
        @ranking = Ranking.where(:category_of_question_id => @ranking_category.id)
      end
    end
  end
end

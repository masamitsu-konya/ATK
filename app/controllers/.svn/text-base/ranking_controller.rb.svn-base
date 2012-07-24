class RankingController < ApplicationController
  def index
    @past_test_categories = @user.scores.map(&:category_of_question)
    if params[:id] 
      @ranking_category = CategoryOfQuestion.find(params[:id])
    else 
      @ranking_category = @user.scores.order('updated_at ASC').map(&:category_of_question).last
    end
    @ranking = Ranking.where(:category_of_question_id => @ranking_category.id)
  end
end

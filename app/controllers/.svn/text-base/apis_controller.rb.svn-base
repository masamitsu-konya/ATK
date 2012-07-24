# coding: utf-8
class ApisController < ApplicationController
  layout false

  def recommend_categoy  
    offset = params[:offset].to_i
    if CategoryOfQuestion.all[offset..offset+7]
      @categories = CategoryOfQuestion.all[offset..offset+7]
      @next_offset= offset+8
    else
      offset= 0
      @categories = CategoryOfQuestion.all[offset..offset+7] 
      @next_offset= offset+8
    end
  end

  def pre_recommend_categoy  
    offset = params[:offset].to_i-16
    CategoryOfQuestion.all[offset..offset+7]
    @categories = CategoryOfQuestion.all[offset..offset+7]
    @next_offset= offset+8
    render :action=> "recommend_categoy"
  end

  def top_recommend_category
    offset = params[:offset].to_i
    if CategoryOfQuestion.all[offset..offset+3]
      @recommend_categories = CategoryOfQuestion.all[offset..offset+3]
      @next_offset= offset+4
    else
      offset= 0
      @recommend_categories = CategoryOfQuestion.all[offset..offset+3] 
      @next_offset= offset+4
    end
  end

  def top_pre_recommend_category  
    offset = params[:offset].to_i-8
    @recommend_categories = CategoryOfQuestion.all[offset..offset+3]
    @next_offset= offset+4
    render :action=> "top_recommend_category"
  end

  def past_test_category
    params[:offset] ? offset=params[:offset].to_i : offset=0
    @past_test_categories = @user.scores.all[offset..offset+3].map(&:category_of_question)
    @next_offset= offset+4
  end

  def past_pre_test_category
    offset = params[:offset].to_i-8
    @past_test_categories = @user.scores.all[offset..offset+3].map(&:category_of_question)
    @next_offset= offset+4
    render :action=> "past_test_category"
  end

end

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


  # テストのスコアリング関連
  def judge_answer
    # 問題の結果保存
    Answer.create_record(session[:user_id], params[:question_id], params[:result])

    # 得点の計算
    if params[:question_count].to_i == 0  # 練習問題
      render :json => {:score => "Practice"}
    else  # 本番
      rd_array_user = params[:rd_array_user] == "null" ? "" : params[:rd_array_user]
      g_array_user = params[:g_array_user] == "null" ? "" : params[:g_array_user]
      e_array_user = params[:e_array_user] == "null" ? "" : params[:e_array_user]
      d_array_user = params[:d_array_user] == "null" ? "" : params[:d_array_user]
      result_tag = params[:result] == "true" ? 1 : 0
      result_array_user = params[:result_array_user] == "null" ? result_tag.to_s : params[:result_array_user] + "," + result_tag.to_s
      score_0 = Score.where("category_of_question_id = ?", params[:category_of_question_id].to_i).find_by_user_id(session[:user_id])

      # 文字列を配列に変換
      rd_array_user = rd_array_user.split(",").map{|rd| rd.to_f}
      g_array_user = g_array_user.split(",").map{|g| g.to_f}
      e_array_user = e_array_user.split(",").map{|e| e.to_f}
      d_array_user = d_array_user.split(",").map{|d| d.to_f}
      result_array_user = result_array_user.split(",").map{|result| result.to_i}

      question_rating = QuestionRating.find_by_question_id(params[:question_id].to_i)
      question_rating.rd = 350.0 if question_rating.rd.nil?
      question_rating.rating = 1500.0 if question_rating.rating.nil?
      score_parameters = Score.print_user_parameter(rd_array_user, g_array_user, e_array_user, d_array_user, score_0, question_rating, result_array_user)
      score = score_parameters[:score]
      rd_user = score_parameters[:rd_array_user][-1]

      # 配列を文字列に変換
      rd_array_user = score_parameters[:rd_array_user].map{|rd| rd.to_s}.join(",")
      g_array_user = score_parameters[:g_array_user].map{|g| g.to_s}.join(",")
      e_array_user = score_parameters[:e_array_user].map{|e| e.to_s}.join(",")
      d_array_user = score_parameters[:d_array_user].map{|d| d.to_s}.join(",")
      result_array_user = score_parameters[:result_array_user].map{|result| result.to_s}.join(",")

      # questionのパラメータ更新
      question_parameter = QuestionRating.print_question_parameter(score_0, question_rating, params[:result])
      question_parameter[:rd_question] = 350.0 if question_parameter[:rd_question] > 350.0
      question_rating.update_attributes(:rd => question_parameter[:rd_question], :rating => question_parameter[:rating_question])

      # レスポンス
      render :json => {:score => score, :rd_user => rd_user, :rd_array_user => rd_array_user, :g_array_user => g_array_user,
        :e_array_user => e_array_user, :d_array_user => d_array_user, :result_array_user => result_array_user}
    end
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

class Score < ActiveRecord::Base
  attr_accessible :rd, :score
  acts_as_paranoid

  belongs_to :user
  belongs_to :category_of_question

  INITIAL_SCORE = 1500.0
  INITIAL_RD = 350.0

  validates :user_id, :uniqueness=>{:scope => :category_of_question_id}, :presence => true
  validates :category_of_question_id, :presence=>true
  validates :score, :presence=>true

  scope :beginner, where('score<=300')
  scope :familiar, where('score>? and score<=?',300,449)
  scope :proficient, where('score>? and score<=?',449,699)
  scope :expert, where('score>? and score<=?',669,779)
  scope :master, where('score>? and score<=?',779,800)


  def score_initialize
    self.score = INITIAL_SCORE
    self.rd = INITIAL_RD
  end

  class << self
    # RDの値計算
    def get_rd(rd_0, d)
      rd = Math::sqrt((1.to_f / (rd_0 ** 2) + 1.to_f / d) ** (-1))
      rd = 350.0 if rd > 350.0
      rd
    end

    # g(RD)の計算
    def get_g(rd_question)
      1.to_f / Math::sqrt(1 + 3 * (0.0057565 ** 2) * (rd_question ** 2).to_f / (Math::PI ** 2))
    end

    # Eの計算
    def get_e(g, score_user, rating_question)
      1.to_f / (1 + 10 ** ((-1) * g * (score_user - rating_question).to_f / 400))
    end

    # d^2の値計算
    def get_d(g_ary, e_ary)
      in_sigma = 0.0
      (0..g_ary.length - 1).each do |i|
        in_sigma += (g_ary[i] ** 2) * e_ary[i] * (1 - e_ary[i])
      end
      1.to_f / ((0.0057565 ** 2) * in_sigma)
    end

    # スコアの計算
    def calculate_score(rd_ary_last, d_ary_last, g_ary, e_ary, score_user, result)
      (0..g_ary.length - 1).each do |i|
        score_user += 0.0057565 / (1.to_f / (rd_ary_last ** 2) + 1.to_f / d_ary_last) * g_ary[i] * (result[i] - e_ary[i])
      end
      score_user
    end

    # 全パラメータを出力
    def print_user_parameter(rd_array_user, g_array_user, e_array_user, d_array_user, score_0, question_rating, result_array_user)
      g_array_user << self.get_g(question_rating.rd)
      e_array_user << self.get_e(g_array_user[-1], score_0.score, question_rating.rating)
      d_array_user << self.get_d(g_array_user, e_array_user)
      rd_array_user << self.get_rd(score_0.rd, d_array_user[-1])
      score = self.calculate_score(rd_array_user[-1], d_array_user[-1], g_array_user, e_array_user, score_0.score, result_array_user)

      score_parameter = {
        :g_array_user => g_array_user,
        :e_array_user => e_array_user,
        :d_array_user => d_array_user,
        :rd_array_user => rd_array_user,
        :result_array_user => result_array_user,
        :score => score
      }
    end

    def regist_user_score(user_id, category_id, sum_score)
      if Score.where(:user_id => user_id, :category_of_question_id => category_id)
        @user_score = Score.where(:user_id => user_id, :category_of_question_id => category_id).last
        @user_score.attributes={:score => sum_score}
      else
        @user_score = Score.new
        @user_score.user_id = user_id
        @user_score.category_of_question_id = category_id
        @user_score.score = sum_score
      end
      @user_score.save
    end
  end
end

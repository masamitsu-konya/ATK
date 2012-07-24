class AddRankAndPublicAndScoreAndTimeToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :rank, :integer
    add_column :questions, :public, :boolean, :default=> false
    add_column :questions, :score, :integer
    add_column :questions, :time, :integer
  end
end

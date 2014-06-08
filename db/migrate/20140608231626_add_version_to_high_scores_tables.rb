class AddVersionToHighScoresTables < ActiveRecord::Migration
  def change
    add_column :waddle_war_scores, :version, :string, :default => "1.0"
    add_column :frog_game_scores, :version, :string, :default => "1.0"
  end
end

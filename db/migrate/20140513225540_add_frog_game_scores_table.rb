class AddFrogGameScoresTable < ActiveRecord::Migration
  def change
    create_table :frog_game_scores do |t|
      t.string :name, :null => false
      t.integer :score, :default => 0

      t.timestamps
    end
    add_index :frog_game_scores, :score
    add_index :frog_game_scores, :created_at
  end
end

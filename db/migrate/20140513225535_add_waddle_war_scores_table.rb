class AddWaddleWarScoresTable < ActiveRecord::Migration
  def change
    create_table :waddle_war_scores do |t|
      t.string :name, :null => false
      t.integer :score, :default => 0

      t.timestamps
    end
    add_index :waddle_war_scores, :score
    add_index :waddle_war_scores, :created_at
  end
end

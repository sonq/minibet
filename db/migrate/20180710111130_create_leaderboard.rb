class CreateLeaderboard < ActiveRecord::Migration[5.1]
  def change
    create_table :leaderboards do |t|
      t.string   :username
      t.string   :point
      t.string   :match
      t.datetime :due
      t.timestamps
    end
   
  end
end

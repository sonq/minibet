class AddPkToBets < ActiveRecord::Migration[5.1]
  def change
    add_index :bets, [:fixture_id, :user_id], unique: true
  end
end

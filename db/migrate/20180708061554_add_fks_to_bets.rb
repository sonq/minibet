class AddFksToBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets, :user_id, :integer
    add_column :bets, :fixture_id, :integer
  end
end

class AddColumnsBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets, :result, :integer
    add_column :bets, :homescore, :integer
    add_column :bets, :awayscore, :integer
  end
end

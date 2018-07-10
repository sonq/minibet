class ChangeColumnTypesBets < ActiveRecord::Migration[5.1]
  def change
    remove_column :bets, :result
    remove_column :bets, :homescore
    remove_column :bets, :awayscore
  end
end

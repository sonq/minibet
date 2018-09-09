class ChangeWeekColumnTypeToString < ActiveRecord::Migration[5.1]
  def change
      change_column :bets, :week, :string
  end
end

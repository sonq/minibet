class AddWeeksToBets < ActiveRecord::Migration[5.1]
  def change
     add_column :bets, :week, :integer
  end
end

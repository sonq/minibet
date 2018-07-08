class CreateBets < ActiveRecord::Migration[5.1]
  def change
    create_table :bets do |t|
      t.string :bettype
      t.string :homescore
      t.string :awayscore
      t.string :result
      t.timestamps
    end
  end
end

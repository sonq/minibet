class CreateFixtures < ActiveRecord::Migration[5.1]
  def change
    create_table :fixtures do |t|
      t.text     :fixturenotes
      t.string   :hometeam
      t.string   :awayteam
      t.integer  :result
      t.integer  :homescore
      t.integer  :awayscore
      t.datetime :due
      t.timestamps

    end
  end
end

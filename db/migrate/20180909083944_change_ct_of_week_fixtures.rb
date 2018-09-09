class ChangeCtOfWeekFixtures < ActiveRecord::Migration[5.1]
  def change
          change_column :fixtures, :week, :string
  end
end

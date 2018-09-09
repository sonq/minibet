class AddWeeksToFixtures < ActiveRecord::Migration[5.1]
  def change
        add_column :fixtures, :week, :integer
  end
end

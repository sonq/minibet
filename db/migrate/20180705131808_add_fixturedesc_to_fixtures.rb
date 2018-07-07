class AddFixturedescToFixtures < ActiveRecord::Migration[5.1]
  def change
    add_column :fixtures, :description, :string
  end
end

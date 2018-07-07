class AddUseradminToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :useradmin, :string
  end
end

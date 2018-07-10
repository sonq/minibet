class AddAdminFlagToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :adminflag, :boolean, default: false
  end
end

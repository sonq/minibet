class AddUsermailToUsers < ActiveRecord::Migration[5.1]
  def change
        add_column :users, :usermail, :string
  end
end

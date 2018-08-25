class OtherbetsV02 < ActiveRecord::Migration[5.1]
  def change
                update_view :otherbets, version: 2, revert_to_version: 1
  end
end

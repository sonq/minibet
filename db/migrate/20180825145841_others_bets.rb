class OthersBets < ActiveRecord::Migration[5.1]
  def change
    create_view :otherbets
  end
end

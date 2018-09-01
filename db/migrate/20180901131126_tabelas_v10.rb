class TabelasV10 < ActiveRecord::Migration[5.1]
  def change
        update_view :tabelas, version: 10, revert_to_version: 9
  end
end

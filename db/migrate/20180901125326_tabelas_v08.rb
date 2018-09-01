class TabelasV08 < ActiveRecord::Migration[5.1]
  def change
            update_view :tabelas, version: 8, revert_to_version: 7
  end
end

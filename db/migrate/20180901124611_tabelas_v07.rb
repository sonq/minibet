class TabelasV07 < ActiveRecord::Migration[5.1]
  def change
        update_view :tabelas, version: 7, revert_to_version: 6
  end
end

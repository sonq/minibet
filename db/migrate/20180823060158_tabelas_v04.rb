class TabelasV04 < ActiveRecord::Migration[5.1]
  def change
            update_view :tabelas, version: 4, revert_to_version: 3
  end
end

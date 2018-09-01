class TabelasV11 < ActiveRecord::Migration[5.1]
  def change
            update_view :tabelas, version: 11, revert_to_version: 10
  end
end

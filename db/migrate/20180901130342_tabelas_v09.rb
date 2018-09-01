class TabelasV09 < ActiveRecord::Migration[5.1]
  def change
    update_view :tabelas, version: 9, revert_to_version: 8
  end
end

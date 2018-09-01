class TabelasV12 < ActiveRecord::Migration[5.1]
  def change
                update_view :tabelas, version: 12, revert_to_version: 11
  end
end

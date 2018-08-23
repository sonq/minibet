class TabelasV06 < ActiveRecord::Migration[5.1]
  def change
                    update_view :tabelas, version: 6, revert_to_version: 5
  end
end

class TabelasV13 < ActiveRecord::Migration[5.1]
  def change

                    update_view :tabelas, version: 13, revert_to_version: 12
  end
end

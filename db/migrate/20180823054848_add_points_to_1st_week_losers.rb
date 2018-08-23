class AddPointsTo1stWeekLosers < ActiveRecord::Migration[5.1]
  def change
        update_view :tabelas, version: 3, revert_to_version: 2
  end
end

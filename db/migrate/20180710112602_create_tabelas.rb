class CreateTabelas < ActiveRecord::Migration[5.1]
  def change
    create_view :tabelas
  end
end

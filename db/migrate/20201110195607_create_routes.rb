class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.string :inicio
      t.string :destino

      t.timestamps
    end
  end
end

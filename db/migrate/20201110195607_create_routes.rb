class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.integer :inicio_city_id
      t.integer :destino_city_id
      t.string :nombre
      t.string :duracion
      
      t.timestamps
    end
  end
end

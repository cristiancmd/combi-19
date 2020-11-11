class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.datetime :horario
      t.date :fecha_inicio
      t.date :fecha_fin
      t.string :chofer
      t.integer :bus
      t.integer :route
      
      t.timestamps
    end
  end
end

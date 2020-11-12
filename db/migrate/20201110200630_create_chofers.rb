class CreateChofers < ActiveRecord::Migration[6.0]
  def change
    create_table :chofers do |t|
      t.string :nombre
      t.string :apellido
      t.integer :dni
      t.date :inicio_actividad

      t.timestamps
    end
  end
end

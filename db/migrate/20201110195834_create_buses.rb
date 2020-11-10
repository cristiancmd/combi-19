class CreateBuses < ActiveRecord::Migration[6.0]
  def change
    create_table :buses do |t|
      t.integer :asientos
      t.string :tipo
      t.string :patente
      t.timestamps
    end
  end
end

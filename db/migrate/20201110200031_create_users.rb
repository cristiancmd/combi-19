class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellido
      t.string :email
      t.date :fecha_nacimiento
      t.integer :tipo
      t.integer :dni
      
      t.timestamps
    end
  end
end

class CreateAdditionals < ActiveRecord::Migration[6.0]
  def change
    create_table :additionals do |t|
      t.string :nombre
      t.integer :stock
      t.integer :precio

      t.timestamps
    end
  end
end

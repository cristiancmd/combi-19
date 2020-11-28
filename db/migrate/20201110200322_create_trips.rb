class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.datetime :horario
      t.decimal :rate
      t.belongs_to :chofer, foreign_key: {to_table: :chofers}
      t.belongs_to :bus, foreign_key: {to_table: :buses}
      t.belongs_to :route, foreign_key: {to_table: :routes}

      t.timestamps
    end
  end
end

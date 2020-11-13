class UpdateRoutes < ActiveRecord::Migration[6.0]
  def change
  	change_table :routes do |t|
  		t.remove :inicio_city_id
  		t.remove :destino_city_id
  		t.belongs_to :initial_city, foreign_key: {to_table: :cities}
  		t.belongs_to :destination_city, foreign_key: {to_table: :cities}
  	end
  end
end

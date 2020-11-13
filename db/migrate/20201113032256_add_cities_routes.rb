class AddCitiesRoutes < ActiveRecord::Migration[6.0]
  def self.up
    create_table :cities_routes, :id => false do |t|
      t.integer :city_id
      t.integer :route_id
      
    end
  end

  def self.down
    drop_table :cities_routes
  end
end

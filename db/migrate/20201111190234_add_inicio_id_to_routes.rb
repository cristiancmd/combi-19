class AddInicioIdToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :inicio_id, :integer
    add_column :routes, :destino_id, :integer
  end
end

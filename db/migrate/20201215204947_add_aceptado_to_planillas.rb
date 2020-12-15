class AddAceptadoToPlanillas < ActiveRecord::Migration[6.0]
  def change
  	add_column :planillas, :aceptado, :boolean
  end
end

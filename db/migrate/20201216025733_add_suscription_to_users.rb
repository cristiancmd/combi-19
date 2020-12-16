class AddSuscriptionToUsers < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :suscripcion, :boolean , default: false
  end
end

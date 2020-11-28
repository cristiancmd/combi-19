class AddCreditcardToOrders < ActiveRecord::Migration[6.0]
  def change
  	change_table :orders do |t|
  	
    	t.integer :tarjeta
    	t.decimal :cobro
  	end
  end
end

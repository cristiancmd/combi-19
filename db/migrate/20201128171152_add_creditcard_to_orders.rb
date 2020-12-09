class AddCreditcardToOrders < ActiveRecord::Migration[6.0]
  def change
  	change_table :orders do |t|
  	
    	t.integer :tarjeta
    	t.decimal :cobro
  	end
  	create_table :additionals_orders, id: false do |t|
      t.belongs_to :order
      t.belongs_to :additional
    end
  end
end

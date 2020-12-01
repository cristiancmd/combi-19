class UpdateOrders < ActiveRecord::Migration[6.0]
  def change
  		add_column :orders, :canceled, :boolean, default: false
  		add_column :orders, :refunded, :decimal
  end
end

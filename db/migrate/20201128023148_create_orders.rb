class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
    t.belongs_to :trip, foreign_key: {to_table: :trips}
    t.belongs_to :user, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end

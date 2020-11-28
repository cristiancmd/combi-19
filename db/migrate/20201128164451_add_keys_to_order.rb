class AddKeysToOrder < ActiveRecord::Migration[6.0]
  def change
  	change_table :orders do |t|
  		t.belongs_to :trip, foreign_key: {to_table: :trips}
    	t.belongs_to :user, foreign_key: {to_table: :users}
  	end
  end
end

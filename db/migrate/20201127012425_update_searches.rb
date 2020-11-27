class UpdateSearches < ActiveRecord::Migration[6.0]
  def change
  	change_table :searches do |t|
	  	t.belongs_to :origen, foreign_key: {to_table: :cities}
	    t.belongs_to :destino, foreign_key: {to_table: :cities}
	  end
  end
end

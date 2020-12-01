class AddColumnToOrder < ActiveRecord::Migration[6.0]
	  def change
	   
	    	change_table :orders do |t|
		  		t.belongs_to :additional, foreign_key: {to_table: :additionals}
		    
		  	end
	  
	  end
end


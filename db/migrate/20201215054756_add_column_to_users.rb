class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
  	  add_column :users, :covid_at, :datetime

  end
end

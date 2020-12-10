class AddDiscardedAtToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :discarded_at, :datetime
    add_index :trips, :discarded_at
  end
end

class AddLastBidIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :last_bid_id, :integer
    add_index :products, :last_bid_id
  end
end

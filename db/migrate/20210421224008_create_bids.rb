class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.decimal :bid_price, precision: 8, scale: 2
      t.index :bid_price
      t.decimal :bid_increment, precision: 8, scale: 2
      t.boolean :auto_bid, :default => false
      t.decimal :auto_bid_increment, precision: 8, scale: 2
      t.decimal :auto_bid_max_price, precision: 8, scale: 2

      t.timestamps
    end
  end
end

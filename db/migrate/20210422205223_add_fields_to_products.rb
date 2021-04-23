class AddFieldsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :is_auction, :boolean
    add_index :products, :is_auction
    add_column :products, :auction_starting_price, :decimal, precision: 8, scale: 2
    add_column :products, :auction_duration, :string
    add_column :products, :is_sale, :boolean
    add_index :products, :is_sale
    add_column :products, :sale_price, :decimal, precision: 8, scale: 2
    add_column :products, :shipment_type, :string
    add_column :products, :shipment_fee, :decimal, precision: 8, scale: 2
    add_column :products, :active, :boolean
    add_index :products, :active
  end
end

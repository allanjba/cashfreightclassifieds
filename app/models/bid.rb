class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :bid_price, presence: true
  validates_numericality_of :bid_price, greater_than: ->(bid) { bid.product.price}
end

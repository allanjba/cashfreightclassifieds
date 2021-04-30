class Bid < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :user
  belongs_to :product

  validates :bid_price, presence: true
  validates_numericality_of :bid_price, greater_than: ->(bid) { bid.product.current_bid_price.to_i}

  def price
    # needs include NumberHelper
    number_with_precision( self.bid_price, :precision => 2)
  end

  def price_plus(i)
    # Needs NumberHelper
    number_with_precision( self.bid_price + i, :precision => 2)
  end

end

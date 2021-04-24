class Product < ApplicationRecord
  include PgSearch::Model
  include ActionView::Helpers::NumberHelper

  belongs_to :user
  has_many :auctions
  has_and_belongs_to_many :categories
  has_many_attached :images
  has_many :favorites
  has_many :bids
  
  # has_many :users, through: :favorites

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  # validates :categories, presence: true
  validates :images, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..15.megabytes }

  # search related
  pg_search_scope :search_by_title, against: :title
  pg_search_scope :search, against: [:title, :description], 
                    using: {tsearch: {dictionary: "english"}},
                    associated_against: { categories: :name, user: :username}
  
  def increase_visit
    self.views += 1
    save!
  end

  def heighest_bid
    if self.bids.present?
      Bid.find(self.last_bid_id)
    end
  end

  def current_bid_price
      number_with_precision( self.heighest_bid.bid_price, :precision => 2)
  end

  def bid_price_plus(i)
    number_with_precision( self.heighest_bid.bid_price + i, :precision => 2)
  end

  def heighest_bidder
    if self.bids.present?
      self.heighest_bid.user
    else
      self.user
    end
  end

  def time_remaining
    # don't use localtime or it won't calculate the remaning time right
    ends_at = self.created_at + self.auction_duration.to_i.days
    remaining = ends_at - Time.now
    
    
    if remaining > 1.day
      days = (remaining / 86400).floor
      string = "#{days}d %Hh"
    elsif remaining > 1.hour
      string = "%Hh %Mm "
    else
      string = "%Mm %Ss "
    end
    # transform seconds in date time format
    # needs to use utc to calculate time left
    Time.at(remaining).utc.strftime(string)
  end

  def closes_at
    # use localtime to show right time for user
    ends_at = self.created_at.localtime + self.auction_duration.to_i.days
    date =  ends_at.today? ? "Today": "%m/%d"
    ends_at.strftime("Ends #{date} at %I:%M%p")
  end

  def auction_is_active?
    self.created_at.localtime + self.auction_duration.to_i.days > Time.now
  end
 
 
  private

end

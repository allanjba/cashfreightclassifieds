class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  needs to add :confirmable

  has_many :products, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy
  has_many :bids, dependent: :destroy
  has_many :notifications, as: :recipient
  
  has_one_attached :avatar, dependent: :destroy

  acts_as_messageable

  validates :username, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :zipcode, presence: true
  validates :state, presence: true
  validates :city, presence: true

  validates :avatar, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..6.megabytes }


  def favorited?(product)
    favorites.find_by(product_id: product.id).present?
  end

  def name
    return "#{first_name}" 
  end
  def mailboxer_email(object)
    return email
  end


end

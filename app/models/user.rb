class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  needs to add :confirmable

  has_many :products
  has_one_attached :avatar

  validates :username, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :zipcode, presence: true
  validates :state, presence: true
  validates :city, presence: true

  validates :avatar, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..6.megabytes }
end

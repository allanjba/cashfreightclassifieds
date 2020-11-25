class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  # validates :images, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..6.megabytes }


  
  def increase_visit
    self.views += 1
    save!
  end

  private



end

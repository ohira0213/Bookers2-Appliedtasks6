class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true,
    length: { minimum: 1, maximum: 200 }
  
  def get_profile_image
    if profile_image.attached?
      profile_image
    else
      'no_image.jpg'
    end
  end
  
  def attach_default_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
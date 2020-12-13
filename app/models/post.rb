class Post < ApplicationRecord
  validates :content, {presence: true, length: {minimum: 2, maximum: 40}}
  validates :post_image, {presence: true}

  attachment :post_image

  belongs_to :enduser
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  #誰かユーザーにお気に入りされてるか？
  def favorited_by?(enduser)
   favorites.where(enduser_id: enduser.id).exists?
  end
end

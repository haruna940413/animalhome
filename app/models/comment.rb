class Comment < ApplicationRecord
  validates :comment, presence: true

  belongs_to :enduser
  belongs_to :post
end
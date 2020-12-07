class Inquiry < ApplicationRecord
  validates :name, presence: true
  validates :message, presence: true
  validates :email, presence: true, length: {maximum:255},
  format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  
end
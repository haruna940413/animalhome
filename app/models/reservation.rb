class Reservation < ApplicationRecord
  validates :start_date, {presence: true, uniqueness: true}
  # validates :end_date, {presence: true, uniqueness: true }

  belongs_to :enduser
end
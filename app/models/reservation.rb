class Reservation < ApplicationRecord
  belongs_to :enduser
  belongs_to :pet
end

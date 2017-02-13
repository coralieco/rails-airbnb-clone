class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bed
  validates :checkin_on, presence: true
  validates :checkout_on, presence: true
end

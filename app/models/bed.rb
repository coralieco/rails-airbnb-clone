class Bed < ApplicationRecord

  BLANKET = ["Wool blanket", "duvet", "sleeping bag", "none"]

  belongs_to :user
  validates :address, presence: true
  validates :title, presence: true
  validates :photo, presence: true
  validates :price, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :zipcode, presence: true
  validates :blanket_type, inclusion: { in: BLANKET,
      message: "%{value} is not a valid blanket type" }

  has_many :bookings, dependent: :destroy
  has_attachment :photo
end


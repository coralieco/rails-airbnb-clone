class Bed < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

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
      message: "%{value} is not a valid blanket type" }, presence: true

  has_many :bookings, dependent: :destroy
  has_attachment :photo
end


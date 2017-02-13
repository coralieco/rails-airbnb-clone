class Bed < ApplicationRecord
  belongs_to :user
  validates :address, presence: true
  validates :title, presence: true
  validates :photo, presence: true
  validates :price, presence: true
  has_many :bookings, dependent: :destroy
end

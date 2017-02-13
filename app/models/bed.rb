class Bed < ApplicationRecord
  belongs_to :user
  validates :address, presence: true
  validates :title, presence: true
  validates :photo, presence: true
  validates :price, presence: true
end

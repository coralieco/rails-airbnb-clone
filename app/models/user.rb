class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  GENDER = %w(Woman Man Both)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  validates :gender, presence: true, inclusion: { in: GENDER,
      message: "%{value} is not a valid gender" }
  validates :photo, presence: true
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  has_many :beds, dependent: :destroy
  has_many :bookings
  has_many :reviews, through: :bookings
  # has_many :bookings, through: :beds
  has_attachment :photo
end

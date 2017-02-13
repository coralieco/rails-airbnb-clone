class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  validates :gender, presence: true
  validates :photo, presence: true
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  has_many :beds, dependent: :destroy
end

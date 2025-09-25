class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :categories, through: :skills
  
  validates :email_address, presence: true, uniqueness: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end

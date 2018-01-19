class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  # Validations
  has_one :profile
  # has_many :user_rooms
  # has_many :rooms, through: :user_rooms
end


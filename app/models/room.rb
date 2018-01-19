class Room < ApplicationRecord
  has_many :user_rooms
  has_many :users, through: :user_rooms

  validates :name, :presence => true
  validates :password, length: { minimum: 8 }, allow_blank: true
  validates :password, length: { minimum: 8 }, allow_nil: true
  validates :isActive, :presence => true
  validates :isPublic, :presence => true
end

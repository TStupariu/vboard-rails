class Room < ApplicationRecord
  has_many :user_rooms
  has_many :users, through: :user_rooms
  belongs_to :user, :class_name => 'User', :foreign_key => 'creator_id'
end

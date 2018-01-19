class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :role, :presence => true
end

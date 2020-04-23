class Recipe < ApplicationRecord
  belongs_to :user

  scope :by_user, -> (user_id) { where( user_id: user_id) }
  accepts_nested_attributes_for :user
end

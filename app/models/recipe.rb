class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :ingredients
  has_many :steps

  scope :by_user, -> (user_id) { where( user_id: user_id) }
  accepts_nested_attributes_for :user
end

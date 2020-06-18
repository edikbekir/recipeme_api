class Recipe < ApplicationRecord
  # mount_uploader :image, ImageUploader

  QUANTITY_POPULAR_RECIPES = 20.freeze

  belongs_to :user
  has_many :ingredients
  has_many :steps

  scope :by_user, -> (user_id) { where( user_id: user_id) }
  scope :popular, -> { order(likes: :desc).limit(QUANTITY_POPULAR_RECIPES) }
  accepts_nested_attributes_for :user
end

class Type < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :ingredients
  has_many :products
end

class Product < ApplicationRecord
  # mount_uploader :image, ImageUploader

  belongs_to :type
  scope :by_type, -> (type_id) { where(type_id: type_id )}
end

class Category < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :subcategories
  accepts_nested_attributes_for :subcategories, allow_destroy: true
end

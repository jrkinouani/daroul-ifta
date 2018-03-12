class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :keywords, dependent: :destroy
  accepts_nested_attributes_for :keywords, allow_destroy: true
end

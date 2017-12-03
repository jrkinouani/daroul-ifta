class Question < ApplicationRecord
  validates :content, presence: true, length: {maximum: 550}
  validates :category, presence: true
  validates :email, presence: true
end

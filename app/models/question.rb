class Question < ApplicationRecord
  validates :content, presence: true, length: {maximum: 550}
  validates :category, presence: true
  validates :email, presence: true
  has_many :answers
  belongs_to :category
end

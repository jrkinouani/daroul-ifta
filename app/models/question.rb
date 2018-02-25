class Question < ApplicationRecord
  validates :content, presence: true, length: {maximum: 550}
  validates :category, presence: true
  validates :email, presence: true
  has_many :answers
  belongs_to :category

  def validate_answers
    answers.select(&:display?)
  end

  def self.with_validates_answers
    Question.joins(:answers).where("nb_validation >= 3 ")
  end
end

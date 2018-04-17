class Question < ApplicationRecord
  validates :content, presence: true, length: { maximum: 550 }
  validates :category, presence: true
  validates :email, presence: true
  has_many :answers
  has_many :question_subcategories, dependent: :destroy
  has_many :subcategories, through: :question_subcategories
  has_many :question_keywords, dependent: :destroy
  has_many :keywords, through: :question_keywords
  belongs_to :category
  accepts_nested_attributes_for :subcategories, allow_destroy: true

  def validate_answers
    answers.select(&:display?)
  end

  def self.with_validates_answers
    Question.joins(:answers).where("nb_validation >= 3 ")
  end

  def self.search(search)
     Question.with_validates_answers.where("questions.content LIKE ?", "%#{search}%")

  end
end

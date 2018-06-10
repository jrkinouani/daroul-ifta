class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :admin
  has_many :validations
  before_save :add_validation

  def display?
    nb_validation >= 3
  end

  def add_validation
    update(nb_validation: validations.count)
  end
end

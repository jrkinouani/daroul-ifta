class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :admin
  has_many :validations

  def display?
    (nb_validation || validations.count) >= 3
  end
end

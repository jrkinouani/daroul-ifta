class Answer < ApplicationRecord
  belongs_to :question , dependent: :destroy
  belongs_to :admin
  belongs_to :writer
  has_many :validations,  dependent: :destroy
  before_save :add_validation

  def display?
    nb_validation >= 3
  end

  def add_validation
    nb_validation =  validations.count
  end
end

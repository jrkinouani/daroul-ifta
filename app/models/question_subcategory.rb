class QuestionSubcategory < ApplicationRecord
  belongs_to :subcategory
  belongs_to :question
end

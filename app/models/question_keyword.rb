class QuestionKeyword < ApplicationRecord
  belongs_to :keyword
  belongs_to :question
end

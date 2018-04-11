class Validation < ApplicationRecord
  belongs_to :answer
  belongs_to :admin

  def self.find_or_create admin_id, answer_id
    validation = self.find_by(admin_id: admin_id, answer_id: answer_id)
    return validation if validation #self.where(admin_id: admin_id, answer_id: answer_id).empty?
    validation = self.create(admin_id: admin_id, answer_id: answer_id)
    answer = Answer.find(answer_id)
    answer.update(nb_validation: answer.validations.count)
    validation
  end
end

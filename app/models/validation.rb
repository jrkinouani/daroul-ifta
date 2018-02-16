class Validation < ApplicationRecord
  belongs_to :answer
  belongs_to :admin

  def self.find_or_create admin_id, answer_id
    return unless self.where(admin_id: admin_id, answer_id: answer_id).empty?
    self.create(admin_id: admin_id, answer_id: answer_id)
  end
end

class ValidationsController < ApplicationController

  def create
    @validation = Validation.find_or_create(params[:admin_id], params[:answer_id])
    AdminMailer.new_validation(@validation.answer, @validation.admin).deliver_now
    if @validation.answer.display?
      AdminMailer.new_public_question(@validation.answer.question).deliver_now
      UserMailer.new_answer(@validation.answer.question, @validation.answer, @validation.answer.question.email).deliver_now
    end
    redirect_back(fallback_location: root_path)
  end
end
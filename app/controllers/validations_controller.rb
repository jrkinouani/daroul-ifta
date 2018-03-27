class ValidationsController < ApplicationController

  def create
    @validation = Validation.find_or_create(params[:admin_id], params[:answer_id])
    AdminMailer.new_answer(@validation.answer).deliver_later
    AdminMailer.new_public_question(@validation.answer.question).deliver_later if @validation.answer.display?
    redirect_back(fallback_location: root_path)
  end

end
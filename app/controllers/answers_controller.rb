class AnswersController < ApplicationController
  def create
    @answer = Answer.create(answer_params)
    AdminMailer.new_answer(@answer, @answer.question).deliver_later
    UserMailer.new_answer(@answer, @answer.question).deliver_later
    redirect_back(fallback_location: root_path)
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id, :admin_id)
  end
end
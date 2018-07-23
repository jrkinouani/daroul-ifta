class AnswersController < ApplicationController
  def create
    @answer = Answer.create(answer_params)
    AdminMailer.new_answer(@answer.question, @answer).deliver_now
    # UserMailer.new_answer(@answer.question, @answer, @answer.question.email ).deliver_later
    redirect_back(fallback_location: root_path)
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id, :admin_id, :writer_id)
  end
end
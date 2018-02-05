class AnswersController < ApplicationController
  def create
    @answer = Answer.create(answer_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id, :admin_id)
  end
end
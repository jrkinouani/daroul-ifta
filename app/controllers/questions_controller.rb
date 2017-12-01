class QuestionsController < ApplicationController
before_action :set_question, only: [:show]
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: "Votre question a été validé"
    else
      render "new"
    end
  end

  def show
  end
  private

  def set_question
    @questions = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, :category, :email)
  end
end
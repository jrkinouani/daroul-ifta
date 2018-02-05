class QuestionsController < ApplicationController
  before_action :set_question, only: [:show]
  def index
    @questions = Question.all
    category = Category.where(name: params[:category]).first
    @question = @question.where(category_id: category.id) if category
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
    @answer = Answer.new(question_id: @question.id, admin_id: current_admin.id) if admin_signed_in?
  end
  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, :category_id, :email)
  end
end

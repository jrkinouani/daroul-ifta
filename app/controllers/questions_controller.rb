class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :delete_subcategories, :delete_keywords, :add_subcategories, :add_keywords]
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

      redirect_to root_path, notice: 'Votre question a été validée'
    else
      render 'new'
    end
  end

  def update
    subcategory_ids = @question.subcategories.ids
    keyword_ids = @question.keywords.ids
    new_subcategory = []
    new_keywords = []
    question_params[:subcategories_attributes].each do |id, subcat |
      new_subcategory << subcat[:id].to_i
      if subcat[:keywords_attributes]
        subcat[:keywords_attributes].each do |key, keyword|
          new_keywords << keyword[:id]
        end
      end
    end
    new_subcategory = new_subcategory - subcategory_ids
    new_keywords = new_keywords - keyword_ids
    @question.keywords << Keyword.where(id: new_keywords)
    @question.subcategories << Subcategory.where(id: new_subcategory)
    redirect_to @question
  end

  def add_subcategories
    subcategory_ids = @question.subcategories.ids
    keyword_ids = @question.keywords.ids
    new_subcategory = []
    question_params[:subcategories_attributes].each do |id, subcat |
      new_subcategory << subcat[:id].to_i
    end
    new_subcategory = new_subcategory - subcategory_ids
    @question.subcategories << Subcategory.where(id: new_subcategory)
    render partial: 'questions/subcategories', locals: {question: @question}
  end

  def add_keywords
    subcategory_ids = @question.subcategories.ids
    keyword_ids = @question.keywords.ids
    new_subcategory = []
    new_keywords = []
    question_params[:subcategories_attributes].each do |id, subcat |
      new_subcategory << subcat[:id].to_i
      if subcat[:keywords_attributes]
        subcat[:keywords_attributes].each do |key, keyword|
          new_keywords << keyword[:id]
        end
      end
    end
    new_subcategory = new_subcategory - subcategory_ids
    new_keywords = new_keywords - keyword_ids
    @question.keywords << Keyword.where(id: new_keywords)
    @question.subcategories << Subcategory.where(id: new_subcategory)
    render partial: 'questions/subcategories', locals: {question: @question}
  end

  def show
    return unless admin_signed_in?
    @answer = Answer.new(question_id: @question.id, admin_id: current_admin.id)
    @category = @question.category
    @subcategory = @category.subcategories.last
    @question.keywords.build if @question.keywords.empty?
  end

  def delete_subcategories
    @question.subcategories.delete(params[:subcategory_id])
    redirect_to @question
  end

  def delete_keywords
    @question.keywords.delete(params[:keyword_id])
    redirect_to @question
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(
      :content,
      :category_id,
      :email,
      subcategories_attributes: [
        :id,
        :_destroy,
        keywords_attributes: [
          :id,
          :_destroy
        ]
      ]
    )
  end
end

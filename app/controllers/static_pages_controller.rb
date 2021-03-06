class StaticPagesController < ApplicationController
  def home
    @questions = Question.with_validates_answers.paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
    @hadiths = Hadith.all
    @informations = Information.all
    @zakatnissabs = Zakatnissab.all
    @categorys = Category.all
  end

  def apropos
  end

  def category
    if params[:category]
      @category_id = Category.find_by(name: params[:category]).id
      @questions = Question.with_validates_answers.where(category_id: @category_id).order('created_at DESC')
    end
    @questions = Question.with_validates_answers.joins(:subcategories).where(subcategories: { id: params[:subcategory] }) if params[:subcategory]
  end

  def faq
  end

  def alone
    @question = Question.find_by(id: params[:id])
    @category = @question.category
    @subcategory = @category.subcategories.last
    @question.keywords.build if @question.keywords.empty?
    @answer = Answer.new(question_id: @question.id, writer_id: current_writer.id) if writer_signed_in?
    @question.update(view_count: @question.view_count + 1)
  end

  def search
    if params[:search]
      @questions = Question.search(params[:search]).order("created_at DESC")
    else
      @questions = Question.all.order('created_at DESC')
    end
  end
end

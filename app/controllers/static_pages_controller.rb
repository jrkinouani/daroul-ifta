class StaticPagesController < ApplicationController
  def home
    @questions = Question.all
    @hadiths = Hadith.all
    @Informations = Information.all
    @nisabs = Nisab.all
    @categorys = Category.all
  end

  def apropos
  end

  def category
    @category_id = Category.find_by(name: params[:category]).id
    @questions = Question.with_validates_answers.where(category_id: @category_id).order('created_at DESC')
  end

  def faq

  end

  def alone
    @questions = Question.find_by(id: params[:id])
  end

  def search
    if params[:search]
      @questions = Question.search(params[:search]).order("created_at DESC")
    else
      @questions = Question.all.order('created_at DESC')
    end
  end

end

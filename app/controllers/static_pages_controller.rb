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


  def faq

  end
  def search
    if params[:search]
      @questions = Question.search(params[:search]).order("created_at DESC")
    else
      @questions = Question.all.order('created_at DESC')
    end
  end

end

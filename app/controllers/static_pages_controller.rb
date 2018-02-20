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
end

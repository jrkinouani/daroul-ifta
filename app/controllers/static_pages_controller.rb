class StaticPagesController < ApplicationController
  def home
    @questions = Question.all
    @hadiths = Hadith.all
    @Informations = Information.all
    @nisabs = Nisab.all
  end

  def apropos

  end

  def faq

  end
end

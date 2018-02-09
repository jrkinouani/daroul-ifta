class StaticPagesController < ApplicationController
  def home
    @questions = Question.all
    @hadiths = Hadith.all
  end

  def apropos

  end

  def faq

  end
end

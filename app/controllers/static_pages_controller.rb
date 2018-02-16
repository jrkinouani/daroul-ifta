class StaticPagesController < ApplicationController
  def home
    @questions = Question.all
    @nisabs = Nisab.all
  end

  def apropos

  end

  def faq

  end
end

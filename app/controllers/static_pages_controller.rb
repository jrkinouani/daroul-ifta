class StaticPagesController < ApplicationController
  def home
    @questions = Question.all
  end

  def apropos

  end

  def faq

  end
end

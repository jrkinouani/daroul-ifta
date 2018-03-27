class AdminMailer < ApplicationMailer

  def new_answer(question, answer)
    @emails = Admin.pluck :email
    @question = question
    @answer = answer
    mail(to: @emails, subject: 'New answers')
  end

  def new_validation(answer)
    @emails = Admin.pluck :email
    @answer = answer
    mail(to: @emails, subject: 'New validation')
  end

  def new_public_question(question)
    @emails = Admin.pluck :email
    @question = question
    mail(to: @emails, subject: 'New validation')
  end
end

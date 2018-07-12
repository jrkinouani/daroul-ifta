class AdminMailer < ApplicationMailer

  def new_answer(question, answer)
    @emails = Admin.pluck :email
    @question = question
    @answer = answer
    mail(to: @emails, subject: 'Nouvelle réponse')
  end

  def new_validation(answer, admin)
    @emails = Admin.pluck :email
    @answer = answer
    @admin = admin
    mail(to: @emails, subject: 'Nouvelle validation')
  end

  def new_question(question)
    @emails = Admin.pluck :email
    @question = question
    mail(to: @emails, subject: 'Nouvelle question')
  end

  def new_public_question(question)
    @emails = Admin.pluck :email
    @question = question
    mail(to: @emails, subject: 'Nouvelle question')
  end
end

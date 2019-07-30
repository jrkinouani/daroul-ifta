class AdminMailer < ApplicationMailer
  def new_answer(question, answer)
    @emails = Admin.notificable.pluck :email
    @question = question
    @answer = answer
    @user = answer.admin || answer.writer
    mail(to: @emails, subject: 'Nouvelle réponse  ')

  end

  def new_validation(answer, admin)
    @emails = Admin.notificable.pluck :email
    @answer = answer
    @question = answer.question
    @admin = admin
    mail(to: @emails, subject: 'Nouvelle validation')
  end

  def new_question(question)
    @emails = Admin.notificable.pluck(:email) + Writer.notificable.pluck(:email)
    @question = question
    mail(to: @emails, subject: 'Nouvelle question')
  end

  def new_public_question(question)
    @emails = Admin.notificable.pluck :email
    @question = question
    mail(to: @emails, subject: 'Nouvelle question')
  end
end

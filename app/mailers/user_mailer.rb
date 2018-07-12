class UserMailer < ApplicationMailer
  def new_answer(question, answer, email)
    @email = email
    @question = question
    @answer = answer
    mail(to: @email, subject: 'New answers')
  end
end

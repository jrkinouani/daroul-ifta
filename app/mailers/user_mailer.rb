class UserMailer < ApplicationMailer
  def new_answer(question, answer, user)
    @user = user
    @question = question
    @answer = answer
    mail(to: @user.email, subject: 'New answers')
  end
end

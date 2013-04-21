class UserMailer < ActionMailer::Base

  def welcome_email(user)
    @user = user
    @from = "\"Calendher Welcome\" <welcome@calendher.com>"
    mail(from: @from, to: @user.email, subject: "Welcome to Calendher!")
  end
end

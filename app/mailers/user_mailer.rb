class UserMailer < ActionMailer::Base

  def welcome_email(user)
    @user = user
    @from = "\"Calendher\" <welcome@calendher.com>"
    mail(from: @from, to: @user.email, subject: "Thanks for signing up!")
  end
end
